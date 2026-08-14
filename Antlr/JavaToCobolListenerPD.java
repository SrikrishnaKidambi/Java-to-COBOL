import org.antlr.v4.runtime.TokenStream;

import java.net.IDN;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

import javax.swing.undo.StateEdit;

import org.antlr.v4.runtime.tree.TerminalNode;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;

public class JavaToCobolListenerPD extends JavaParserBaseListener{
    private IntrinsicFunctionConverter intrinsicFunctionConverter;
    private static final String INDENT="       ";
    private static final String INDENT_COMMENT="      ";
    private final TokenStream tokens;
    private final StringBuilder cobolCodePD = new StringBuilder();
    //*********Important************//
    private boolean insideSwitch=false;
    private boolean insideblock=false; // please add boolean for block type contructs and the use or to insideblock to handle the period logic
    private void updateInsideBlock() {
        insideblock = (!switchStack.isEmpty() || !blockStack.isEmpty() || inMethod);
    }
    private Stack<String>blockStack=new Stack<>();
    private Stack<Boolean> switchStack = new Stack<>();
    private Stack<Integer>ifStatementStack=new Stack<>();
    private int currentIfLevel=0;
    private int braceDepth=0;
    private boolean justEnteredIf=false;
    private boolean inElseBlock=false;
    private boolean expectingElse=false;
    private Stack<Boolean> elseExpectedStack=new Stack<>();
    private Set<String>forLoopInitVars=new HashSet<>();
    private boolean insideForLoopHeader=false;
    private StringBuilder methodBuffer=null;
    private String currentMethodPara=null;
    private boolean inMethod=false;

    // OOP support
    private Map<String, ClassInfoExtractor.ClassInfo> classInfoMap = Collections.emptyMap();
    private Map<String, String> objectVariables = new LinkedHashMap<>(); // varName → className
    private String currentClassName = null;  // class being translated now

    private final Map<String,Map<String,String>>methodVarNameMap=new HashMap<>();
    private final Map<String,String>globalVarNameMap=new HashMap<>();
    private final Map<String, String> returnVars = new LinkedHashMap<>(); // methodName -> Java type
    private String currentMethod=null;
    private Map<String,List<String>>methodParameters=new HashMap<>();
    LinkedHashMap<String,StringBuilder>methodCodeMap=new LinkedHashMap<>();
    private int tempCounter = 0;
    Stack<List<String>> forLoopRecomputeStack = new Stack<>();
    Stack<List<String>> whileRecomputeStack = new Stack<>();
    Stack<List<String>> doWhileRecomputeStack = new Stack<>();
    Stack<String> doWhileCondStack = new Stack<>();

    private static class ConditionResult {
        String condition;
        List<String> precomputeStatements;
        List<String> recomputeStatements;

        ConditionResult(String condition,
                        List<String> precomputeStatements,
                        List<String> recomputeStatements) {
            this.condition = condition;
            this.precomputeStatements = precomputeStatements;
            this.recomputeStatements = recomputeStatements;
        }
    }



    private Set<String> tempVars = new HashSet<>();

    private String newTemp(){
        String t = "TEMP_" + (tempCounter++);
        tempVars.add(t);
        return t;
    }

    private boolean hasArithmetic(String s){
        if (s == null || s.trim().isEmpty()) return false;
        s = s.trim();
        // Exclude COBOL FUNCTION expressions - hyphens in FUNCTION names are not arithmetic
        if (s.contains("FUNCTION ")) return false;
        // RETURN-<method> is a COBOL identifier, not a subtraction expression.
        if (s.matches("RETURN-[a-zA-Z_][a-zA-Z0-9_]*")) return false;
        // Generated COBOL data names are hyphenated identifiers, not subtraction.
        String withoutCobolNames = s.replaceAll("\\b[A-Z][A-Z0-9_]*(?:-[A-Z0-9_]+)+\\b", "NAME");
        // Exclude reference modification like s(1:3) - colon is not arithmetic
        return withoutCobolNames.matches(".*[+\\-*/%].*");
    }

    /** COBOL MOVE/COMPUTE applies the destination PIC; Java casts need no emitted syntax. */
    private String stripJavaCasts(String text) {
        return text.replaceAll(
                "\\(\\s*(?:byte|short|int|long|float|double|char|boolean|String|[A-Z][a-zA-Z0-9_]*(?:\\s*<[^()]*>)?)\\s*\\)",
                "");
    }

    private boolean emitNumericDeclaration(String text) {
        Matcher declaration = Pattern.compile(
                "^\\s*(byte|short|int|long|float|double)\\s+(\\w+)\\s*=\\s*(.+?)\\s*;?\\s*$")
                .matcher(text);
        if (!declaration.matches()) {
            return false;
        }

        String target = declaration.group(2);
        String rhs = declaration.group(3).trim();
        Matcher cast = Pattern.compile("^\\(\\s*(byte|short|int|long|float|double)\\s*\\)\\s*(.+)$")
                .matcher(rhs);
        if (cast.matches()) {
            String castType = cast.group(1);
            String operand = cast.group(2).trim();
            if (castType.matches("byte|short|int|long")) {
                emitCobol(INDENT + "COMPUTE " + target + " = FUNCTION INTEGER-PART(" + operand + ")"
                        + (insideblock ? "\n" : ".\n"));
            } else {
                emitCobol(INDENT + "MOVE " + operand + " TO " + target + (insideblock ? "\n" : ".\n"));
            }
            return true;
        }

        if (rhs.matches("[+-]?\\d+(?:\\.\\d+)?") || rhs.matches("[a-zA-Z_][a-zA-Z0-9_]*")) {
            emitCobol(INDENT + "MOVE " + rhs + " TO " + target + (insideblock ? "\n" : ".\n"));
            return true;
        }
        return false;
    }

    private boolean emitNumericCastAssignment(String text) {
        Matcher assignment = Pattern.compile(
                "^\\s*(\\w+)\\s*=\\s*\\(\\s*(byte|short|int|long|float|double)\\s*\\)\\s*(.+?)\\s*;?\\s*$")
                .matcher(text);
        if (!assignment.matches()) {
            return false;
        }

        String target = assignment.group(1);
        String castType = assignment.group(2);
        String operand = assignment.group(3).trim();
        if (castType.matches("byte|short|int|long")) {
            emitCobol(INDENT + "COMPUTE " + target + " = FUNCTION INTEGER-PART(" + operand + ")"
                    + (insideblock ? "\n" : ".\n"));
        } else {
            emitCobol(INDENT + "MOVE " + operand + " TO " + target + (insideblock ? "\n" : ".\n"));
        }
        return true;
    }

    public int getNumberOfTempVars(){
        return tempCounter;
    }

    public Map<String, String> getReturnVars() {
        return Collections.unmodifiableMap(returnVars);
    }

    public Map<String, String> getObjectVariables() {
        return Collections.unmodifiableMap(objectVariables);
    }

    @Override
    public void enterCompilationUnit(JavaParser.CompilationUnitContext ctx) {
        collectReturnTypes(ctx);
    }

    private void collectReturnTypes(ParseTree node) {
        if (node instanceof JavaParser.MethodDeclarationContext) {
            JavaParser.MethodDeclarationContext method = (JavaParser.MethodDeclarationContext) node;
            String returnType = method.typeTypeOrVoid().getText();
            if (!"void".equals(returnType)) {
                returnVars.put(method.identifier().getText(), returnType);
            }
            List<String> parameters = new ArrayList<>();
            if (method.formalParameters() != null
                    && method.formalParameters().formalParameterList() != null) {
                for (JavaParser.FormalParameterContext parameter
                        : method.formalParameters().formalParameterList().formalParameter()) {
                    parameters.add(parameter.variableDeclaratorId().getText());
                }
            }
            methodParameters.put(method.identifier().getText(), parameters);
        }
        for (int i = 0; i < node.getChildCount(); i++) {
            collectReturnTypes(node.getChild(i));
        }
    }


    @Override
    public void enterMethodDeclaration(JavaParser.MethodDeclarationContext ctx){
        addLeadingComments(ctx);
        String methodName=ctx.identifier().getText();
        String returnType = ctx.typeTypeOrVoid().getText();
        boolean oopMethod = currentClassName != null && !methodName.equals("main");
        String methodKey = oopMethod ? currentClassName + "#" + methodName : methodName;
        if (!oopMethod && !"void".equals(returnType)) {
            returnVars.put(methodName, returnType);
        }
        currentMethod=methodKey;
        String methodPara=methodName.equals("main") ? INDENT + "MAIN-PARA."
                : INDENT + (oopMethod ? currentClassName.toUpperCase() + "-" + methodName.toUpperCase()
                : methodName) + "-PARA.";
        methodBuffer=new StringBuilder();
        methodBuffer.append('\n').append(methodPara).append('\n');
        methodCodeMap.put(methodKey, methodBuffer);
        currentMethodPara=methodPara;
        inMethod=true;
        methodVarNameMap.putIfAbsent(currentMethod, new HashMap<>());
        updateInsideBlock();

        // collect the name of the parameters
        List<String>parameters=new ArrayList<>();
        Map<String,String>parameterMap=new HashMap<>();
        if(ctx.formalParameters()!=null && ctx.formalParameters().formalParameterList()!=null){
            for(JavaParser.FormalParameterContext fp:ctx.formalParameters().formalParameterList().formalParameter()){
                String paramName=fp.variableDeclaratorId().getText();
                String cobolParam = oopMethod
                        ? oopParameterName(currentClassName, methodName, paramName)
                        : paramName;
                parameters.add(cobolParam);
                parameterMap.put(paramName, cobolParam);
            }
        }
        methodParameters.put(methodKey, parameters);
        methodVarNameMap.put(methodKey, parameterMap);
    }

    @Override
    public void exitMethodDeclaration(JavaParser.MethodDeclarationContext ctx){
        // if(inMethod && methodBuffer!=null && currentMethodPara!=null){
        //     cobolCodePD.append('\n').append(currentMethodPara).append("\n").append(methodBuffer).append(INDENT).append("EXIT.\n");
        //     methodBuffer=null;
        //     currentMethodPara=null;
        //     inMethod=false;
        //     updateInsideBlock();
        // }
        // currentMethod=null;

        methodBuffer=null;
        currentMethodPara=null;
        inMethod=false;
        updateInsideBlock();
        currentMethod=null;
    }

    // ── OOP: treat constructors as named INIT paragraphs ──────────────────
    @Override
    public void enterConstructorDeclaration(JavaParser.ConstructorDeclarationContext ctx) {
        String ctorClass = ctx.identifier().getText();
        currentMethod = ctorClass + "#INIT";
        String paraName = ctorClass.toUpperCase() + "-INIT-PARA";

        methodBuffer = new StringBuilder();
        methodBuffer.append('\n').append(INDENT).append(paraName).append(".\n");
        methodCodeMap.put(currentMethod, methodBuffer);
        currentMethodPara = paraName;
        inMethod = true;
        methodVarNameMap.putIfAbsent(currentMethod, new HashMap<>());

        List<String> params = new ArrayList<>();
        Map<String, String> parameterMap = new HashMap<>();
        if (ctx.formalParameters().formalParameterList() != null) {
            for (var fp : ctx.formalParameters().formalParameterList().formalParameter()) {
                String paramName = fp.variableDeclaratorId().getText();
                String cobolParam = oopParameterName(ctorClass, "INIT", paramName);
                params.add(cobolParam);
                parameterMap.put(paramName, cobolParam);
            }
        }
        methodParameters.put(currentMethod, params);
        methodVarNameMap.put(currentMethod, parameterMap);
        updateInsideBlock();
    }

    @Override
    public void exitConstructorDeclaration(JavaParser.ConstructorDeclarationContext ctx) {
        methodBuffer = null;
        currentMethodPara = null;
        inMethod = false;
        updateInsideBlock();
        currentMethod = null;
    }
    // ──────────────────────────────────────────────────────────────────────

    private void emitCobol(String line){
        if(inMethod && methodBuffer!=null){
            methodBuffer.append(line);
        }else{
            cobolCodePD.append(line);
        }
    }

    private void mapVariable(String javaVar,String cobolVar){
        if(currentMethod!=null && !"main".equals(currentMethod)){
            methodVarNameMap.get(currentMethod).put(javaVar, cobolVar);
        }else{
            globalVarNameMap.put(javaVar, cobolVar);
        }
    }

    private String getCobolVarName(String javaVar){
        if(currentMethod!=null && !"main".equals(currentMethod)){
            Map<String,String>localMap=methodVarNameMap.getOrDefault(currentMethod, Collections.emptyMap());
            if(localMap.containsKey(javaVar)){
                return localMap.get(javaVar);
            }
        }

        if(globalVarNameMap.containsKey(javaVar)){
            return globalVarNameMap.get(javaVar);
        }

        // ── OOP: bare identifier that isn't a parameter or local variable.
        // If we're inside an instance method/constructor of a class that
        // declares a field with this name, Java treats it as an implicit
        // `this.field` reference. Resolve it to the scratch object record
        // (CLASSNAME-OBJ-FIELDNAME) so it round-trips through the same
        // record that PERFORM-based method dispatch already MOVEs in/out of.
        if (currentClassName != null && currentMethod != null
                && currentMethod.startsWith(currentClassName + "#")
                && classHasField(currentClassName, javaVar)) {
            return currentClassName.toUpperCase() + "-OBJ-" + javaVar.toUpperCase();
        }

        return javaVar;
    }

    //**************************** //
    Set<String> stringVars = new HashSet<>();
    Set<String> charVariables = new HashSet<>();
    public JavaToCobolListenerPD(TokenStream tokens) {
        this(tokens, Collections.emptyMap());
    }

    public JavaToCobolListenerPD(TokenStream tokens,
                              Map<String, ClassInfoExtractor.ClassInfo> classInfoMap) {
        this.tokens = tokens;
        this.classInfoMap = classInfoMap == null ? Collections.emptyMap() : classInfoMap;
        intrinsicFunctionConverter = new IntrinsicFunctionConverter();
        cobolCodePD.append(INDENT).append("PROCEDURE DIVISION.\n\n");
    }
    public String getCobolCodePD(){
        cobolCodePD.setLength(0); // Clear previous content!
        // Re-add the PROCEDURE DIVISION header which was initially added in the constructor
        cobolCodePD.append(INDENT).append("PROCEDURE DIVISION.\n\n");

        // initially emit the ENTRY-PARA method that will initialise the flow of the program invoking the main method.
        cobolCodePD.append("\n")
            .append(INDENT).append("ENTRY-PARA.\n")
            .append(INDENT).append("    PERFORM MAIN-PARA\n")
            .append(INDENT).append("    STOP RUN.\n\n");


        // emit non-main methods initially
        for(Map.Entry<String,StringBuilder>entry:methodCodeMap.entrySet()){
            if(!entry.getKey().equals("main")){
                cobolCodePD.append(entry.getValue().toString());
                cobolCodePD.append(INDENT).append("EXIT.").append("\n\n");
            }
        }

        // emit the main method at the last
        if(methodCodeMap.containsKey("main")){
            cobolCodePD.append(methodCodeMap.get("main").toString());
            cobolCodePD.append(INDENT).append("EXIT.\n\n");
        }

        return cobolCodePD.toString();
    }

    @Override
    public void enterClassDeclaration(JavaParser.ClassDeclarationContext ctx) {
        currentClassName = ctx.identifier().getText();
    }

    @Override
    public void exitClassDeclaration(JavaParser.ClassDeclarationContext ctx) {
        currentClassName = null;
    }

    //-----------Declaration types---------------
    @Override
    public void enterLocalVariableDeclaration(JavaParser.LocalVariableDeclarationContext ctx){
        // suppress the MOVE for variable declaration that is done inside the for loop.
        addLeadingComments(ctx);
        if(insideForLoopHeader){
            return;
        }
       
        String sourceText = tokens.getText(ctx);
        if (emitNumericDeclaration(sourceText)) {
            return;
        }
        String text=stripJavaCasts(sourceText);
        text = intrinsicFunctionConverter.accomodateIntrinsicFunctions(text);
        System.out.println("Text before "+text);
        text = convertArrayAccessToCobol(text);
        // Order matters: resolve qualified refs (this.field / obj.field) using
        // their RAW field names first, then let the generic bare-identifier
        // pass (replaceVarsWithCobolNames) run last. Reversing this order lets
        // the generic pass rewrite a bare field name inside "this.field" before
        // replaceThisFieldRefs sees it, producing a double-prefixed reference
        // like DOG-OBJ-DOG-OBJ-NAME.
        text = replaceVarsWithCobolNames(replaceObjFieldRefs(replaceThisFieldRefs(text)));
        System.out.println("Text after "+text);

        if (text.contains("?") && text.contains(":") && text.contains("=")
                && handleTernaryAssignment(text)) {
            return;
        }

        // ---- Fix 3: brace array initializer {1,2,3} ----
        // Matches: int[] nums = {1,2,3} or int[] nums = {1, 2, 3}
        {
            java.util.regex.Pattern braceInit = java.util.regex.Pattern.compile(
                "^(?:int|long|double|float|short|byte|char|String)\\[\\]\\s+(\\w+)\\s*=\\s*\\{([^}]+)\\}\\s*;?$"
            );
            java.util.regex.Matcher bm = braceInit.matcher(text.trim());
            if (bm.matches()) {
                String arrVar  = bm.group(1);
                String[] elems = bm.group(2).split(",");
                for (int ei = 0; ei < elems.length; ei++) {
                    String val = elems[ei].trim();
                    // COBOL arrays are 1-based
                    emitCobol(INDENT + "MOVE " + val + " TO " + arrVar + "(" + (ei + 1) + ")"
                        + (insideblock ? "\n" : ".\n"));
                }
                return;
            }
        }

        // ── OOP: object instantiation  ClassName var = new ClassName(args) ─
        {
            Pattern newObjPat = Pattern.compile(
                "^(\\w+)\\s+(\\w+)\\s*=\\s*new\\s+(\\w+)\\s*\\(([^)]*)\\)\\s*;?$");
            Matcher nm = newObjPat.matcher(text.trim());
            if (nm.matches()) {
                String typeName = nm.group(1);
                String varName = nm.group(2);
                String ctorName = nm.group(3);
                String argList = nm.group(4);
                if (classInfoMap.containsKey(typeName)) {
                    objectVariables.put(varName, typeName);
                    ClassInfoExtractor.ClassInfo cls = classInfoMap.get(typeName);
                    List<String> args = splitArgs(argList);
                    String instRecord = typeName.toUpperCase() + "-" + varName.toUpperCase() + "-INST";
                    emitCobol(INDENT + "INITIALIZE " + instRecord + "\n");
                    if (!cls.constructors.isEmpty()) {
                        ClassInfoExtractor.MethodInfo constructor = cls.constructors.get(0);
                        emitCobol(INDENT + "MOVE " + instRecord + " TO "
                                + typeName.toUpperCase() + "-OBJ\n");
                        for (int ci = 0; ci < Math.min(constructor.paramNames.size(), args.size()); ci++) {
                        emitCobol(INDENT + "MOVE "
                                + translateArgumentExpression(args.get(ci))
                                + " TO " + oopParameterName(typeName, "INIT",
                                        constructor.paramNames.get(ci)) + "\n");
                        }
                        emitCobol(INDENT + "PERFORM " + typeName.toUpperCase() + "-INIT-PARA\n");
                        emitCobol(INDENT + "MOVE " + typeName.toUpperCase() + "-OBJ TO "
                                + instRecord + "\n");
                    }
                    return;
                }
            }
        }
        // ─────────────────────────────────────────────────────────────────

        // Declarations can initialise from an instance method with a return value.
        if (handleAssignmentWithMethodCalls(text)) {
            return;
        }

        //check for chars
        if (text.startsWith("char ")) {
            String declarationText = text.substring(5); // remove "char "
            String[] declarations = declarationText.split(";");
            for (String decl : declarations) {
                String[] parts = decl.split("=");
                String var = parts[0].trim();
                if (var.contains("[")) {
                    var = var.substring(0, var.indexOf("[")).trim(); // handle arrays like char[] c
                }
                charVariables.add(var);
                // if (parts.length == 2) {
                //     String rhs = parts[1].trim();

                //     // ✅ Only generate MOVE if it's a single char literal like 'A'
                //     if (rhs.matches("'[^']'")) {
                //         cobolCodePD.append(INDENT)
                //             .append("MOVE ").append(rhs).append(" TO ").append(var)
                //             .append(insideblock ? "\n" : ".\n");
                //     }
                //     // ❌ For other cases like expressions or casts, skip COBOL generation here
                // }

            }

        }
        //things need to be done before char conversion
        if (text.contains("Scanner") && text.contains("System.in")){
            // cobolCodePD.append(INDENT_COMMENT).append("* Input from ODT is enabled\n");
            emitCobol(INDENT_COMMENT + "* Input from ODT is enabled\n");
            return;
        }
        else if ((text.matches(".*=\\s*\\w+\\.next(?:Line|Int|Double|Float|Byte|Short|Long|Boolean)?\\s*\\(\\s*\\)\\s*(\\.charAt\\s*\\(\\s*\\d+\\s*\\))?\\s*;?"))) {
            String[] parts = text.split("=");
            System.out.println(parts[0] + " and " + parts[1]);

            if (parts.length == 2) {
                String varDecl = parts[0].trim(); // e.g., "int b" or "name"
                String[] tokens = varDecl.split("\\s+"); // Split by whitespace
                String var = tokens[tokens.length - 1]; // Get variable name
                
                // cobolCodePD.append(INDENT).append("ACCEPT ").append(var).append(insideblock?"\n":".\n");
                emitCobol(INDENT+"ACCEPT "+var+(insideblock?"\n":".\n"));
            }
            return;
        }
        else if (text.matches("^(\\w+\\s+)?\\w+\\s*=\\s*(\"[^\"]*\"|'[^']*'|\\w+(\\([^)]*\\))?)\\s*;?$")) {
            // move statement mapping
            String[] parts = text.split("=");
            // System.out.println(text+" found in move");
            if(text.startsWith("String")){
                for (JavaParser.VariableDeclaratorContext var : ctx.variableDeclarators().variableDeclarator()) {
                    String varName = var.variableDeclaratorId().getText();
                    stringVars.add(varName);  // collect the string variable names.
                }
            }
            if (parts.length == 2) {
                String lhs = parts[0].trim();
                String[] lhsTokens = lhs.split("\\s+");
                String targetVar = lhsTokens[lhsTokens.length - 1]; // get variable name

                if(forLoopInitVars.contains(targetVar)){
                    return;
                }

                String rhs = parts[1].replace(";", "").trim();
                if(rhs.equals("true")){
                    rhs="'Y'";
                }
                else if(rhs.equals("false")){
                    rhs="'N'";
                }
                // Match string/char literals or simple variables/literals
                if (rhs.matches("\"[^\"]*\"|'[^']*'|\\w+(\\([^)]*\\))?|[\\w\\d_]+")) {
                    emitCobol((INDENT)+
                            ("MOVE ") + (rhs) + (" TO ") + (targetVar) + (insideblock?"\n":".\n"));
                    // cobolCodePD.append(INDENT)
                    //         .append("MOVE ").append(rhs).append(" TO ").append(targetVar).append(insideblock?"\n":".\n");
                }
            }
            return;
        }
        else if(text.matches("^\\s*String\\[\\]\\s+\\w+\\s*=\\s*\\w+\\.split\\(\"[^\"]+\"\\)\\s*;?\\s*$")){
            String[] parts = text.split("=");
            String lhs= parts[0].trim();
            String rhs = parts[1].replace(";","").trim();

            String varName = lhs.replaceAll("String\\[\\]\\s*", "").trim();
            if(!stringVars.contains(varName)){
                stringVars.add(varName);
            }
            Pattern splitPattern = Pattern.compile("^(\\w+)\\.split\\(\"([^\"]+)\"\\)$");
            Matcher matcher = splitPattern.matcher(rhs);
            if (matcher.find()) {
                String sourceVar = matcher.group(1); // e.g., input
                String delimiter = matcher.group(2); // e.g., "-"
                // Estimate number of splits (you can tune this or parse sample input if available)
                int estimatedParts = 5;
                //-------------Important note is above ☝️ we need to get the map of array sizes from data division and then update estimated parts by that value.
                // Generate INTO part: parts(1), parts(2), ...
                StringBuilder intoClause = new StringBuilder();
                for (int i = 1; i <= estimatedParts; i++) {
                    intoClause.append(varName).append("(").append(i).append(")");
                    if (i < estimatedParts) intoClause.append(", ");
                }

                // Emit COBOL UNSTRING
                emitCobol((INDENT)
                    +("UNSTRING ")+(sourceVar)
                    +(" DELIMITED BY \"")+(delimiter)+("\"")
                    +(" INTO ")+(intoClause.toString())
                    +(insideblock ? "\n" : ".\n"));
                // cobolCodePD.append(INDENT)
                //     .append("UNSTRING ").append(sourceVar)
                //     .append(" DELIMITED BY \"").append(delimiter).append("\"")
                //     .append(" INTO ").append(intoClause.toString())
                //     .append(insideblock ? "\n" : ".\n");
            }
        }
        else if(text.startsWith("String")){
            for (JavaParser.VariableDeclaratorContext var : ctx.variableDeclarators().variableDeclarator()) {
                String varName = var.variableDeclaratorId().getText();
                stringVars.add(varName);  // collect the string variable names.
            }
            
            if(text.matches(".*=\\s*(\"[^\"]*\"|'[^']*'|\\w+(\\([^)]*\\))?)(\\s*\\+\\s*(\"[^\"]*\"|'[^']*'|\\w+(\\([^)]*\\))?))*\\s*;?")){
                boolean append = text.contains("+=");
                String[] parts=null;
                if(!append){
                    parts =text.split("=");
                }
                else{
                    parts=text.split("\\+=");
                }
                if(parts.length==2){
                    String lhs = parts[0].trim();
                    String[] lhsTokens = lhs.split("\\s+");
                    String targetVar = lhsTokens[lhsTokens.length-1];
                    // if (!stringVars.contains(targetVar)) {
                    //     return; // here it is trivial as by default it is present
                    // }
                    String rhs=parts[1].replace(";", "").trim();
                    String[] rhsOperands = rhs.split("\\+");
                    for(int i=0;i<rhsOperands.length;i++){
                        rhsOperands[i] =rhsOperands[i].trim();
                    }
                    emitCobol(INDENT + "STRING ");
                    // cobolCodePD.append(INDENT).append("STRING ");
                    if(append){
                        emitCobol((targetVar)+(" DELIMITED BY SPACE \n"));
                        // cobolCodePD.append(targetVar).append(" DELIMITED BY SPACE \n");
                    }
                    for(int i=0;i<rhsOperands.length-1;i++){
                        // if(rhsOperands[i].equals("\" \"")){
                        //     cobolCodePD.append(INDENT).append(rhsOperands[i]).append("\n");
                        // }
                        // else
                        String delimiter = ((rhsOperands[i].startsWith("\"") && rhsOperands[i].endsWith("\"") || 
                                                    rhsOperands[i].startsWith("'") && rhsOperands[i].endsWith("'"))) 
                                        ? " DELIMITED BY SIZE \n" : " DELIMITED BY SPACE \n";
                        emitCobol((INDENT)+(rhsOperands[i])+(delimiter));
                        // cobolCodePD.append(INDENT).append(rhsOperands[i]).append(" DELIMITED BY SPACE \n");
                    }
                    String lastDelimiter = ((rhsOperands[rhsOperands.length-1].startsWith("\"") && rhsOperands[rhsOperands.length-1].endsWith("\"") || 
                                                    rhsOperands[rhsOperands.length-1].startsWith("'") && rhsOperands[rhsOperands.length-1].endsWith("'"))) 
                                        ? " DELIMITED BY SIZE INTO " : " DELIMITED BY SPACE INTO ";
                    emitCobol((INDENT)+(rhsOperands[rhsOperands.length-1])+(lastDelimiter)+(targetVar)+(insideblock?"\n":".\n"));
                    // cobolCodePD.append(INDENT).append(rhsOperands[rhsOperands.length-1]).append(" ");
                    // emitCobol((" DELIMITED BY SPACE INTO ")+(targetVar)+(insideblock?"\n":".\n"));
                    // cobolCodePD.append(" DELIMITED BY SPACE INTO ").append(targetVar).append(insideblock?"\n":".\n");
                }
            }
            return;
        }
        //convert according to char
        text = expandCompoundAssignments(text);
        text = convertCharExpressions(text);
        System.out.println("Text after char conversion: " + text);
        System.out.println(text.matches("^\\s*char\\s+[a-zA-Z_]\\w*\\s*=\\s*FUNCTION\\s+CHAR\\s*\\(.*\\)\\s*;?\\s*$"));
        if (text.matches("^\\s*char\\s+[a-zA-Z_]\\w*\\s*=\\s*FUNCTION\\s+CHAR\\s*\\(.*\\)\\s*;?\\s*$")) {
            String[] parts = text.split("=", 2); // Split only at the first '='
            if (parts.length == 2) {
                String lhsFull = parts[0].trim();
                String[] lhsTokens = lhsFull.split("\\s+");
                String lhs = lhsTokens[lhsTokens.length - 1];  // Extract only the variable name

                String rhs = parts[1].replaceAll(";$", "").trim(); // Remove trailing semicolon if any

                emitCobol(INDENT + "MOVE " + rhs + " TO " + lhs + (insideblock ? "\n" : ".\n"));
                return;
            }
        }

        
        if(text.matches(".*\\b(boolean)?\\s*\\w+\\s*=\\s*(true|false)\\s*;?")){
            //handles both boolean abc = true/false, abc = true/false
            String[] parts = text.split("=");
            if (parts.length == 2) {
                // Get variable name and assigned value
                String lhs = parts[0].trim();
                String[] lhsTokens = lhs.split("\\s+");
                String varName = lhsTokens[lhsTokens.length - 1].trim();

                String rhs = parts[1].replace(";", "").trim().toLowerCase();
                if(rhs.equals("true")){
                    emitCobol((INDENT)+("SET ")+(varName)+("-TRUE TO TRUE")+(insideblock?"\n":".\n"));
                    // cobolCodePD.append(INDENT).append("SET ").append(varName).append("-TRUE TO TRUE").append(insideblock?"\n":".\n");
                }
                else if (rhs.equals("false")) {
                    emitCobol((INDENT)+("SET ")+(varName)+("-FALSE TO FALSE")+(insideblock ? "\n" : ".\n"));
                    // cobolCodePD.append(INDENT).append("SET ").append(varName).append("-FALSE TO FALSE").append(insideblock ? "\n" : ".\n");
                }
            }
        }
        else if(text.matches(".*=\\s*\\w+\\s*[+\\-\\*\\/\\%]\\s*\\w+\\s*;?")){
            //Handle a=b+c or a=b-c or a=b*c or a=b/c or a=b%c
            String[] parts=text.split("=");
            if(parts.length==2){
                String lhs=parts[0].trim();
                String[] lhstokens=lhs.split("\\s+");
                String targetVar=lhstokens[lhstokens.length-1];

                String rhs=parts[1].replace(";", "").trim();
                int opPos = Math.max(Math.max(Math.max(rhs.indexOf('+'), rhs.indexOf('-')),Math.max(rhs.indexOf('*'),rhs.indexOf("/"))),rhs.indexOf("%"));
                char operator = rhs.charAt(opPos);
                String op1 = rhs.substring(0, opPos).trim();
                String op2 = rhs.substring(opPos + 1).trim();
                if(operator=='+'){
                    emitCobol((INDENT)+("ADD ")+(op1)+(" TO ")+(op2)+(" GIVING ")+(targetVar)+(insideblock?"\n":".\n"));
                    // cobolCodePD.append(INDENT).append("ADD ").append(op1).append(" TO ").append(op2).append(" GIVING ").append(targetVar).append(insideblock?"\n":".\n");
                }
                else if(operator=='-'){
                    emitCobol((INDENT)+("SUBTRACT ")+(op2)+(" FROM ")+(op1)+(" GIVING ")+(targetVar)+(insideblock?"\n":".\n"));
                    //cobolCodePD.append(INDENT).append("SUBTRACT ").append(op2).append(" FROM ").append(op1).append(" GIVING ").append(targetVar).append(insideblock?"\n":".\n");
                }
                else if(operator=='*'){
                    emitCobol((INDENT)+("MULTIPLY ")+(op1)+(" BY ")+(op2)+(" GIVING ")+(targetVar)+(insideblock?"\n":".\n"));
                    // cobolCodePD.append(INDENT).append("MULTIPLY ").append(op1).append(" BY ").append(op2).append(" GIVING ").append(targetVar).append(insideblock?"\n":".\n");
                }
                else if(operator=='/'){
                    emitCobol((INDENT)+("DIVIDE ")+(op1)+(" BY ")+(op2)+(" GIVING ")+(targetVar)+(insideblock?"\n":".\n"));
                    // cobolCodePD.append(INDENT).append("DIVIDE ").append(op1).append(" BY ").append(op2).append(" GIVING ").append(targetVar).append(insideblock?"\n":".\n");
                }
                else if(operator=='%'){
                    String quotientTemp = newTemp();
                    emitCobol((INDENT)+("DIVIDE ")+(op1)+(" BY ")+(op2)+(" GIVING ")+(quotientTemp)+(" REMAINDER ")+(targetVar)+(insideblock?"\n":".\n"));
                }
            }
        }
        else if (text.matches("\\w+\\s*\\+=\\s*\\w+\\s*;?") || text.matches("\\w+\\s*-=\\s*\\w+\\s*;?") || text.matches("\\w+\\s*\\*=\\s*\\w+\\s*;?") || text.matches("\\w+\\s*/=\\s*\\w+\\s*;?") || text.matches("\\w+\\s*%=\\s*\\w+\\s*;?")) {
            // Handle a += b or a -= b or a*=b or a/=b or a%=b
            String operator = text.contains("+=") ? "+" : (text.contains("-=")? "-" : (text.contains("*=")? "*" : (text.contains("/=")? "/": "%")));
            String[] parts=null;
            if(operator.equals("+")){
                parts = text.split("\\+=");
            }
            else if(operator.equals("-")){
                parts = text.split("\\-=");
            }
            else if(operator.equals("*")){
                parts = text.split("\\*=");
            }
            else if(operator.equals("/")){
                parts = text.split("\\/=");
            }
            else if(operator.equals("%")){
                parts = text.split("\\%=");
            }
            if (parts.length == 2) {
                String targetVar = parts[0].trim();
                String operand = parts[1].replace(";", "").trim();
                if(operator.equals("+")){
                    emitCobol((INDENT)+("ADD ")+(operand)+(" TO ")+(targetVar)+(insideblock?"\n":".\n"));
                    // cobolCodePD.append(INDENT).append("ADD ").append(operand).append(" TO ").append(targetVar).append(insideblock?"\n":".\n");
                }
                else if(operator.equals("-")){
                    emitCobol((INDENT)+("SUBTRACT ")+(operand)+(" FROM ")+(targetVar)+(insideblock?"\n":".\n"));
                    // cobolCodePD.append(INDENT).append("SUBTRACT ").append(operand).append(" FROM ").append(targetVar).append(insideblock?"\n":".\n");
                }
                else if(operator.equals("*")){
                    emitCobol((INDENT)+("MULTIPLY ")+(operand)+(" BY ")+(targetVar)+(insideblock?"\n":".\n"));
                    // cobolCodePD.append(INDENT).append("MULTIPLY ").append(operand).append(" BY ").append(targetVar).append(insideblock?"\n":".\n");
                }
                else if(operator.equals("/")){
                    emitCobol((INDENT)+("DIVIDE ")+(operand)+(" INTO ")+(targetVar)+(insideblock?"\n":".\n"));
                    // cobolCodePD.append(INDENT).append("DIVIDE ").append(operand).append(" INTO ").append(targetVar).append(insideblock?"\n":".\n");
                }
                else if(operator.equals("%")){
                    String quotientTemp = newTemp();
                    emitCobol((INDENT)+("DIVIDE ")+(targetVar)+(" BY ")+(operand)+(" GIVING ")+(quotientTemp)+(" REMAINDER ")+(targetVar)+(insideblock?"\n":".\n"));
                }
            }
        }
        else if (text.matches("\\+\\+\\w+\\s*;?") || text.matches("\\-\\-\\w+\\s*;?")) {
            // Handle ++a or --a
            char op=text.charAt(0);
            String var = text.replaceAll("[+;\\-;]", "").trim();
            if(op=='+'){
                emitCobol((INDENT)+("ADD ")+("1 TO ")+(var)+(insideblock?"\n":".\n"));
                // cobolCodePD.append(INDENT).append("ADD ").append("1 TO ").append(var).append(insideblock?"\n":".\n");
            }
            else if(op=='-'){
                emitCobol((INDENT)+("SUBTRACT ")+("1 FROM ")+(var)+(insideblock?"\n":".\n"));
                // cobolCodePD.append(INDENT).append("SUBTRACT ").append("1 FROM ").append(var).append(insideblock?"\n":".\n");
            }
        }
        else if (text.matches("\\w+\\+\\+\\s*;?") || text.matches("\\w+\\-\\-\\s*;?")) {
            // Handle a++ or a--
            char op = text.charAt(text.indexOf('+') != -1 ? text.indexOf('+') : text.indexOf('-'));
            String var = text.replaceAll("[+;\\-;]", "").trim();
            if(op=='+'){
                emitCobol((INDENT)+("ADD ")+("1 TO ")+(var)+(insideblock?"\n":".\n"));
                // cobolCodePD.append(INDENT).append("ADD ").append("1 TO ").append(var).append(insideblock?"\n":".\n");
            }
            else if(op=='-'){
                emitCobol((INDENT)+("SUBTRACT ")+("1 FROM ")+(var)+(insideblock?"\n":".\n"));
                // cobolCodePD.append(INDENT).append("SUBTRACT ").append("1 FROM ").append(var).append(insideblock?"\n":".\n");
            }
        }
        else if (text.matches("\\w+\\s*=\\s*\\w+\\+\\+\\s*;?") || text.matches("\\w+\\s*=\\s*\\w+\\-\\-\\s*;?")) {
            // Handle b = a++ or b = a--
            String[] parts = text.split("=");
            if (parts.length == 2) {
                String lhs = parts[0].trim(); // b
                String rhs = parts[1].replace(";", "").replace("++", "").replace("--","").trim(); // a
                String op = parts[1].replace(";", "").trim();
                op = op.substring(op.length()-1);
                emitCobol((INDENT)+("MOVE ")+(rhs)+(" TO ")+(lhs)+(insideblock?"\n":".\n"));
                // cobolCodePD.append(INDENT).append("MOVE ").append(rhs).append(" TO ").append(lhs).append(insideblock?"\n":".\n");
                if(op.equals("+")){
                    emitCobol((INDENT)+("ADD ")+("1 TO ")+(rhs)+(insideblock?"\n":".\n"));
                    // cobolCodePD.append(INDENT).append("ADD ").append("1 TO ").append(rhs).append(insideblock?"\n":".\n");
                }
                else if(op.equals("-")){
                    emitCobol((INDENT)+("SUBTRACT ")+("1 FROM ")+(rhs)+(insideblock?"\n":".\n"));
                    // cobolCodePD.append(INDENT).append("SUBTRACT ").append("1 FROM ").append(rhs).append(insideblock?"\n":".\n");
                }
            }
        }
        else if (text.matches("\\w+\\s*=\\s*\\+\\+\\w+\\s*;?") || text.matches("\\w+\\s*=\\s*\\-\\-\\w+\\s*;?")) {
            // Handle b = ++a or b = --a
            String[] parts = text.split("=");
            if (parts.length == 2) {
                String lhs = parts[0].trim(); // b
                String rhs = parts[1].replace(";", "").replace("++", "").replace("--","").trim(); // a
                String op = parts[1].replace(";", "").trim();
                op = op.substring(0,1);
                if(op.equals("+")){
                    emitCobol((INDENT)+("ADD ")+("1 TO ")+(rhs)+(insideblock?"\n":".\n"));
                    // cobolCodePD.append(INDENT).append("ADD ").append("1 TO ").append(rhs).append(insideblock?"\n":".\n");
                }
                else if(op.equals("-")){
                    emitCobol((INDENT)+("SUBTRACT ")+("1 FROM ")+(rhs)+(insideblock?"\n":".\n"));
                    // cobolCodePD.append(INDENT).append("SUBTRACT ").append("1 FROM ").append(rhs).append(insideblock?"\n":".\n");
                }
                emitCobol((INDENT)+("MOVE ")+(rhs)+(" TO ")+(lhs)+(insideblock?"\n":".\n"));
                // cobolCodePD.append(INDENT).append("MOVE ").append(rhs).append(" TO ").append(lhs).append(insideblock?"\n":".\n");
            }
        }
        else if(text.matches("(int|float|double|long|short|var|char)?\\s*\\w+\\s*=\\s*[^;]*(?:FUNCTION\\s+\\w+\\([^)]*\\)|[+\\-*/%])[^;]*;?")){
            String[] parts = text.split("=", 2);
            if(parts.length == 2){
                String lhs = parts[0].trim();
                String[] lhsTokens = lhs.split("\\s+");
                String targetVar = lhsTokens[lhsTokens.length - 1];
            
                String rhs = parts[1].replace(";", "").trim();
            
                List<String> preOps = new ArrayList<>();
                List<String> postOps = new ArrayList<>();
            
                // Pre ++ / --
                Pattern prePattern = Pattern.compile("(\\+\\+|--)(\\w+)");
                Matcher preMatcher = prePattern.matcher(rhs);
                StringBuffer sbPre = new StringBuffer();
                while (preMatcher.find()) {
                    String op = preMatcher.group(1);
                    String var = preMatcher.group(2);
                    preOps.add((op.equals("++") ? "ADD 1 TO " : "SUBTRACT 1 FROM ") + var + ".");
                    preMatcher.appendReplacement(sbPre, var);
                }
                preMatcher.appendTail(sbPre);
                rhs = sbPre.toString();
            
                // Post ++ / --
                Pattern postPattern = Pattern.compile("(\\w+)(\\+\\+|--)");
                Matcher postMatcher = postPattern.matcher(rhs);
                StringBuffer sbPost = new StringBuffer();
                while (postMatcher.find()) {
                    String var = postMatcher.group(1);
                    String op = postMatcher.group(2);
                    postOps.add((op.equals("++") ? "ADD 1 TO " : "SUBTRACT 1 FROM ") + var + ".");
                    postMatcher.appendReplacement(sbPost, var);
                }
                postMatcher.appendTail(sbPost);
                rhs = sbPost.toString();
            
                // 🔥 NEW: HANDLE MODULO HERE
                // rhs = stripRedundantParens(rhs);
                rhs = reduceExpression(rhs);

            
                for(String pre : preOps){
                    emitCobol(INDENT + pre + "\n");
                }
            
                emitCobol(INDENT
                        + "COMPUTE "
                        + targetVar
                        + " = "
                        + rhs
                        + (insideblock ? "\n" : ".\n"));
                
                for(String post : postOps){
                    emitCobol(INDENT + post + "\n");
                }
            }
        }

    }

    // ── OOP helpers ────────────────────────────────────────────────────────

    /**
     * Splits a comma-separated argument list, respecting nested parentheses.
     * e.g. splitArgs("\"Rex\", 3, foo(a,b)") → ["\"Rex\"", "3", "foo(a,b)"]
     */
    private List<String> splitArgs(String argList) {
        List<String> args = new ArrayList<>();
        if (argList == null || argList.trim().isEmpty()) return args;
        int depth = 0;
        StringBuilder curr = new StringBuilder();
        for (char c : argList.toCharArray()) {
            if (c == '(') depth++;
            else if (c == ')') depth--;
            else if (c == ',' && depth == 0) {
                args.add(curr.toString().trim());
                curr.setLength(0);
                continue;
            }
            curr.append(c);
        }
        if (curr.length() > 0) args.add(curr.toString().trim());
        return args;
    }

    /**
     * Replaces all "objVar.fieldName" references in text with their flat
     * COBOL record field name: CLASSNAME-VARNAME-INST-FIELDNAME.
     * Called at the top of statementTranslation before any pattern matching.
     */
    private String replaceObjFieldRefs(String text) {
        if (objectVariables.isEmpty() || classInfoMap == null || classInfoMap.isEmpty()) return text;
        Pattern p = Pattern.compile("\\b(\\w+)\\.(\\w+)\\b");
        Matcher m = p.matcher(text);
        StringBuffer sb = new StringBuffer();
        while (m.find()) {
            String obj = m.group(1);
            String field = m.group(2);
            String className = objectVariables.get(obj);
            if (className != null && classInfoMap.containsKey(className)) {
                boolean fieldExists = classHasField(className, field);
                if (fieldExists) {
                    String cobolRef = className.toUpperCase() + "-"
                                    + obj.toUpperCase() + "-INST-"
                                    + field.toUpperCase();
                    m.appendReplacement(sb, Matcher.quoteReplacement(cobolRef));
                    continue;
                }
            }
            m.appendReplacement(sb, Matcher.quoteReplacement(m.group(0)));
        }
        m.appendTail(sb);
        return sb.toString();
    }

    // ──────────────────────────────────────────────────────────────────────

    private String oopParameterName(String className, String methodName, String parameterName) {
        return className.toUpperCase() + "-" + methodName.toUpperCase() + "-" + parameterName.toUpperCase();
    }

    private boolean classHasField(String className, String fieldName) {
        ClassInfoExtractor.ClassInfo info = classInfoMap.get(className);
        if (info == null) return false;
        for (ClassInfoExtractor.FieldInfo field : info.fields) {
            if (field.name.equals(fieldName)) return true;
        }
        return info.parentClass != null && classHasField(info.parentClass, fieldName);
    }

    private String replaceThisFieldRefs(String text) {
        if (currentClassName == null) return text;
        Matcher matcher = Pattern.compile("\\bthis\\.(\\w+)\\b").matcher(text);
        StringBuffer result = new StringBuffer();
        while (matcher.find()) {
            String fieldName = matcher.group(1);
            String replacement = classHasField(currentClassName, fieldName)
                    ? currentClassName.toUpperCase() + "-OBJ-" + fieldName.toUpperCase()
                    : matcher.group();
            matcher.appendReplacement(result, Matcher.quoteReplacement(replacement));
        }
        matcher.appendTail(result);
        return result.toString();
    }

    private String returnVariableForCurrentMethod() {
        if (currentMethod != null && currentMethod.contains("#")) {
            String[] parts = currentMethod.split("#", 2);
            return "RETURN-" + parts[0].toUpperCase() + "-" + parts[1].toUpperCase();
        }
        return "RETURN-" + currentMethod;
    }

    private String replaceVarsWithCobolNames(String line){
        String[] tokens=line.split("\\W+");
        Set<String>seen=new HashSet<>();
        for(String token:tokens){
            if(token==null || token.isEmpty()){
                continue;
            }
            String cobolVar=getCobolVarName(token);
            if(!token.equals(cobolVar) && !seen.contains(token)){
                line=line.replaceAll("\\b"+Pattern.quote(token)+"\\b", cobolVar);
                seen.add(token);
            }
        }
        return line;
    }

    private boolean handleTernaryAssignment(String text) {
        String t = text.trim().replaceAll(";$", "").trim();
        int eqIdx = -1;
        // find the = that is an assignment (not == )
        for (int i = 0; i < t.length(); i++) {
            if (t.charAt(i) == '=' && (i == 0 || t.charAt(i-1) != '!' && t.charAt(i-1) != '<' && t.charAt(i-1) != '>' && t.charAt(i-1) != '=') && (i+1 >= t.length() || t.charAt(i+1) != '=')) {
                eqIdx = i; break;
            }
        }
        if (eqIdx < 0) return false;
        String lhs = t.substring(0, eqIdx).trim();
        String[] lhsParts = lhs.split("\\s+");
        String targetVar = lhsParts[lhsParts.length - 1];
        String rhs = t.substring(eqIdx + 1).trim();
        // find ? not inside parens
        int questionIdx = -1, depth = 0;
        for (int i = 0; i < rhs.length(); i++) {
            char c = rhs.charAt(i);
            if (c == '(') depth++; else if (c == ')') depth--;
            else if (c == '?' && depth == 0) { questionIdx = i; break; }
        }
        if (questionIdx < 0) return false;
        // find : after ?
        int colonIdx = -1; depth = 0;
        for (int i = questionIdx + 1; i < rhs.length(); i++) {
            char c = rhs.charAt(i);
            if (c == '(') depth++; else if (c == ')') depth--;
            else if (c == ':' && depth == 0) { colonIdx = i; break; }
        }
        if (colonIdx < 0) return false;
        String condExpr  = rhs.substring(0, questionIdx).trim();
        String trueExpr  = rhs.substring(questionIdx + 1, colonIdx).trim();
        String falseExpr = rhs.substring(colonIdx + 1).trim();
        String cobolCond = translateCondition(condExpr);
        String trueArg = translateArgumentExpression(processExpressionWithCalls(trueExpr));
        String falseArg = translateArgumentExpression(processExpressionWithCalls(falseExpr));
        emitCobol(INDENT + "IF " + cobolCond + "\n");
        emitCobol(INDENT + "    MOVE " + trueArg  + " TO " + targetVar + "\n");
        emitCobol(INDENT + "ELSE\n");
        emitCobol(INDENT + "    MOVE " + falseArg + " TO " + targetVar + "\n");
        emitCobol(INDENT + "END-IF" + (insideblock ? "\n" : ".\n"));
        return true;
    }

    //-----------------Statement types-------------------
    public void statementTranslation(String text){
        if (emitNumericCastAssignment(text)) {
            return;
        }
        text = stripJavaCasts(text);
        text = intrinsicFunctionConverter.accomodateIntrinsicFunctions(text);
        System.out.println("Text before "+text);
        //array conversion
        text = convertArrayAccessToCobol(text);
        System.out.println("Text after "+text);

        // ── OOP: handle this.field = value ──────────────────────────────────
        // IMPORTANT: this must run on the text BEFORE replaceObjFieldRefs /
        // replaceVarsWithCobolNames, and extract fieldName from the RAW text.
        // Both of those substitution passes resolve bare identifiers that
        // match a class field to CLASSNAME-OBJ-FIELDNAME (see getCobolVarName),
        // which would otherwise also rewrite the "name" inside "this.name"
        // before we get here, producing a double-prefixed field reference
        // (e.g. DOG-OBJ-DOG-OBJ-NAME) when this branch re-applies the prefix.
        if (text.trim().startsWith("this.")) {
            String stripped = text.trim().substring(5);
            int eqIdx = stripped.indexOf('=');
            if (eqIdx > 0) {
                String fieldName = stripped.substring(0, eqIdx).trim();
                String rhs = replaceThisFieldRefs(
                        stripped.substring(eqIdx + 1).replaceAll(";$", "").trim());
                if (currentClassName != null) {
                    String cobolField = currentClassName.toUpperCase()
                                      + "-OBJ-" + fieldName.toUpperCase();
                    String rhsArg = translateArgumentExpression(rhs);
                    emitCobol(INDENT + "MOVE " + rhsArg + " TO " + cobolField
                            + (insideblock ? "\n" : ".\n"));
                }
            }
            return;
        }

        // ── OOP: handle super(args) ────────────────────────────────────────
        // Same ordering rationale as the this.field branch above: must run
        // on raw text, before generic field-name resolution.
        if (text.trim().startsWith("super(") && text.contains(")")) {
            if (currentClassName != null && classInfoMap.containsKey(currentClassName)) {
                String parentName = classInfoMap.get(currentClassName).parentClass;
                if (parentName != null && classInfoMap.containsKey(parentName)) {
                    int ps = text.indexOf('(');
                    int pe = text.lastIndexOf(')');
                    String argList = (ps >= 0 && pe > ps) ? text.substring(ps + 1, pe) : "";
                    List<String> args = splitArgs(argList);
                    List<ClassInfoExtractor.FieldInfo> parentFields = classInfoMap.get(parentName).fields;
                    for (int si = 0; si < Math.min(parentFields.size(), args.size()); si++) {
                        String cobolField = currentClassName.toUpperCase()
                                          + "-OBJ-" + parentFields.get(si).name.toUpperCase();
                        emitCobol(INDENT + "MOVE "
                                + translateArgumentExpression(args.get(si))
                                + " TO " + cobolField + "\n");
                    }
                }
            }
            return;
        }

        // ── OOP: replace obj.field references before any further pattern matching ──
        text = replaceObjFieldRefs(text);
        text = replaceVarsWithCobolNames(text);

        // ── Ternary operator: must run before other pattern matching ───────
        if (text.contains("?") && text.contains(":") && text.contains("=")) {
            if (handleTernaryAssignment(text)) return;
        }

        //to check for strings

        if (handleAssignmentWithMethodCalls(text)) {
            return;
        }

        //to check for strings
        String lhs1 = text.split(text.contains("+=") ? "\\+=" : "=")[0].trim();
        String[] lhsTokens1 = lhs1.split("\\s+");
        String rawVar = lhsTokens1[lhsTokens1.length - 1];

        String cleanedVar = rawVar;
        if (cleanedVar.contains("(")) {
            cleanedVar = cleanedVar.substring(0, cleanedVar.indexOf("("));
        }
        System.out.println(cleanedVar+"****");
        if(cleanedVar.equals("firstname")){
            System.out.println(stringVars.contains("firstname"));
        }
        // System.out.println("Only for" + text.split("=")[0].trim().split("\\s+")[text.split("=")[0].trim().split("\\s+").length-1]);
        // System.out.println("For text "+text+" vals "+text.matches(".*=\\s*(\"[^\"]*\"|'[^']*'|\\w+)(\\s*\\+\\s*(\"[^\"]*\"|'[^']*'|\\w+))*\\s*;?")+" and "+stringVars.contains(text.split("=")[0].trim().split("\\s+")[text.split("=")[0].trim().split("\\s+").length-1]) );


        

        // if(!isTopLevelStatement(ctx)){
        //     return;
        // }

        // String text=tokens.getText(ctx).trim();

        if(text.matches("^[a-zA-Z_][a-zA-Z0-9_]*\\s*\\(.*\\)\\s*;?$") && !text.contains("=")){
            String call=text.substring(0,text.indexOf('(')).trim();
            // String methodName=call.toUpperCase()+"-PARA";
            String methodName=call+"-PARA";
            String argList=text.substring(text.indexOf('(')+1,text.lastIndexOf(')'));

            List<String> argValues = splitArguments(argList);

            List<String>paramNames=methodParameters.getOrDefault(call, new ArrayList<>());
            int count=Math.min(paramNames.size(), argValues.size());
            for (int i = 0; i < count; i++) {
                String rawArg = processExpressionWithCalls(argValues.get(i));
                String finalArg = translateArgumentExpression(rawArg);
                emitCobol(INDENT + "MOVE " + finalArg + " TO " + paramNames.get(i) + "\n");
            }
            emitCobol(INDENT + "PERFORM " + methodName + "\n");
            return;
        }
        // ── OOP: instance method call  obj.method(args) ───────────────────
        {
            Pattern dotCallPat = Pattern.compile(
                "^(\\w+)\\.(\\w+)\\s*\\(([^)]*)\\)\\s*;?$");
            Matcher dotMatcher = dotCallPat.matcher(text.trim());
            if (dotMatcher.matches()) {
                String objVar = dotMatcher.group(1);
                String methName = dotMatcher.group(2);
                String argList = dotMatcher.group(3);
                String className = objectVariables.get(objVar);
                if (className != null && classInfoMap.containsKey(className)) {
                    String instRecord = className.toUpperCase() + "-" + objVar.toUpperCase() + "-INST";
                    String paraName = className.toUpperCase() + "-" + methName.toUpperCase() + "-PARA";
                    emitCobol(INDENT + "MOVE " + instRecord + " TO " + className.toUpperCase() + "-OBJ\n");
                    List<String> argValues = splitArgs(argList);
                    ClassInfoExtractor.ClassInfo cls = classInfoMap.get(className);
                    ClassInfoExtractor.MethodInfo method = cls.methods.stream()
                        .filter(mm -> mm.name.equals(methName))
                        .findFirst().orElse(null);
                    if (method != null) {
                        for (int mi = 0; mi < Math.min(method.paramNames.size(), argValues.size()); mi++) {
                            emitCobol(INDENT + "MOVE "
                                + translateArgumentExpression(argValues.get(mi))
                                + " TO " + oopParameterName(className, methName,
                                        method.paramNames.get(mi)) + "\n");
                        }
                    }
                    emitCobol(INDENT + "PERFORM " + paraName + "\n");
                    emitCobol(INDENT + "MOVE " + className.toUpperCase() + "-OBJ TO " + instRecord + "\n");
                    return;
                }
            }
        }
        // ─────────────────────────────────────────────────────────────────
        // System.out.println("Statement:"+text);

        for (char c : text.toCharArray()) {
            if (c == '{') braceDepth++;
        }
        
        
        // Check for else block - handle various else patterns
        // if (text.contains("else") && !text.contains("else if")) {
        //     // Pattern for }else{ or }else or else{
        //     if (text.matches(".*}\\s*else\\s*\\{.*") || text.trim().startsWith("else") || text.contains("}else")) {
        //         if(!blockStack.isEmpty() && blockStack.peek().startsWith("IF")) {
        //             cobolCodePD.append(INDENT).append("ELSE\n");
        //             inElseBlock = true;
        //             expectingElse = false;
        //             updateInsideBlock();
        //             return;
        //         }
        //     }
        // }
        
        if (text.startsWith("System.out.println") || text.startsWith("System.err.println")) {

            List<String> parts = extractDisplayParts(text);

            // ---- Fix 1.10: empty println() → DISPLAY SPACE (blank line) ----
            if (parts == null || parts.isEmpty()) {
                emitCobol(INDENT + "DISPLAY SPACE" + (insideblock ? "\n" : ".\n"));
                return;
            }

            for (String p : parts) {
                String cobolExpr = processDisplayExpression(p);
                emitCobol(INDENT + "DISPLAY " + cobolExpr +
                          (insideblock ? "\n" : ".\n"));
            }
            return;
        }

        // ---- Fix 1.10: printf is a superset of print — check it BEFORE the plain "print" branch ----
        else if (text.startsWith("System.out.printf") || text.startsWith("System.err.printf")) {
            // printf("format", arg1, arg2, ...)
            // Strategy: parse the format string and interleave DISPLAY calls
            // Simple case: replace %d/%s/%f with the corresponding argument
            int parenOpen  = text.indexOf('(');
            int parenClose = text.lastIndexOf(')');
            if (parenOpen == -1 || parenClose == -1) return;

            String inner = text.substring(parenOpen + 1, parenClose).trim();

            // Split on top-level commas only
            List<String> printfArgs = new ArrayList<>();
            int depth2 = 0;
            StringBuilder curr2 = new StringBuilder();
            for (int ci = 0; ci < inner.length(); ci++) {
                char ch = inner.charAt(ci);
                if (ch == '(') depth2++;
                else if (ch == ')') depth2--;
                else if (ch == ',' && depth2 == 0) {
                    printfArgs.add(curr2.toString().trim());
                    curr2.setLength(0);
                    continue;
                }
                curr2.append(ch);
            }
            if (curr2.length() > 0) printfArgs.add(curr2.toString().trim());

            if (printfArgs.isEmpty()) return;

            String fmtStr = printfArgs.get(0); // e.g. "\"Hello %s, you are %d\""
            // Strip surrounding quotes if present
            if (fmtStr.startsWith("\"") && fmtStr.endsWith("\"")) {
                fmtStr = fmtStr.substring(1, fmtStr.length() - 1);
            }

            // Replace each %d/%s/%f/%c/%n with the next argument or newline
            int argIndex = 1;
            String[] fmtParts = fmtStr.split("(?<=%[dsfcnbxo])|(?=%[dsfcnbxo])");
            for (String seg : fmtParts) {
                if (seg.equals("%n") || seg.equals("\\n")) {
                    emitCobol(INDENT + "DISPLAY SPACE" + (insideblock ? "\n" : ".\n"));
                } else if (seg.matches("%[dsfcbxo]")) {
                    if (argIndex < printfArgs.size()) {
                        String cobolExpr = processDisplayExpression(printfArgs.get(argIndex++));
                        emitCobol(INDENT + "DISPLAY " + cobolExpr
                            + " WITH NO ADVANCING" + (insideblock ? "\n" : ".\n"));
                    }
                } else if (!seg.isEmpty()) {
                    emitCobol(INDENT + "DISPLAY \"" + seg + "\""
                        + " WITH NO ADVANCING" + (insideblock ? "\n" : ".\n"));
                }
            }
            return;
        }

        else if (text.startsWith("System.out.print") || text.startsWith("System.err.print")) {
        
            List<String> parts = extractDisplayParts(text);

            // ---- Fix 1.10: null/empty print → no-op ----
            if (parts == null || parts.isEmpty()) return;
        
            for (int i = 0; i < parts.size(); i++) {
                String cobolExpr = processDisplayExpression(parts.get(i));
            
                emitCobol(
                    INDENT + "DISPLAY " + cobolExpr +
                    " WITH NO ADVANCING" +
                    (insideblock ? "\n" : ".\n")
                );
            }
            return;
        }

        else if ((text.matches(".*=\\s*\\w+\\.next(?:Line|Int|Double|Float|Byte|Short|Long|Boolean)?\\s*\\(\\s*\\)\\s*(\\.charAt\\s*\\(\\s*\\d+\\s*\\))?\\s*;?"))) {
            //scanner class mapped to accept
            String[] parts = text.split("=");
            System.out.println(parts[0] + " and " + parts[1]);

            if (parts.length == 2) {
                String varDecl = parts[0].trim(); // e.g., "int b" or "name"
                String[] tokens = varDecl.split("\\s+"); // Split by whitespace
                String var = tokens[tokens.length - 1]; // Get variable name
                String cobolVar=convertArrayAccessToCobol(varDecl);
                // emitCobol((INDENT)+("ACCEPT ")+(var)+(insideblock?"\n":".\n"));  ---- this is the recent change -------------
                emitCobol((INDENT)+("ACCEPT ")+(cobolVar)+(insideblock?"\n":".\n"));  //---- this is the recent change -------------
                
                // cobolCodePD.append(INDENT).append("ACCEPT ").append(var).append(insideblock?"\n":".\n");
            }
            return;
        }
        // ---- Fix: array element assignment — LHS is a subscripted reference like arr(2) or m(1, 2) ----
        else if (text.matches("^\\w+\\s*\\([^)]+\\)\\s*=\\s*.+;?$")) {
            int eqIdx = text.indexOf('=');
            if (eqIdx > 0) {
                String lhs = text.substring(0, eqIdx).trim();   // e.g. m_main(1, 2)
                String rhs = text.substring(eqIdx + 1).replaceAll(";$", "").trim(); // e.g. 42
                emitCobol(INDENT + "MOVE " + rhs + " TO " + lhs + (insideblock ? "\n" : ".\n"));
            }
            return;
        }
        else if (text.matches("^(\\w+\\s+)?\\w+\\s*=\\s*(\"[^\"]*\"|'[^']*'|\\w+(\\([^)]*\\))?)\\s*;?$")) {
            // move statement mapping
            String[] parts = text.split("=");
            if (parts.length == 2) {
                String lhs = parts[0].trim();
                String[] lhsTokens = lhs.split("\\s+");
                String targetVar = lhsTokens[lhsTokens.length - 1]; // get variable name

                String rhs = parts[1].replace(";", "").trim();
                if(rhs.equals("true")){
                    rhs="'Y'";
                }
                else if(rhs.equals("false")){
                    rhs="'N'";
                }
                // Match string/char literals or simple variables/literals
                if (rhs.matches("\"[^\"]*\"|'[^']*'|\\w+(\\([^)]*\\))?|[\\w\\d_]+")) {
                    emitCobol((INDENT)
                            +("MOVE ")+(rhs)+(" TO ")+(targetVar)+(insideblock?"\n":".\n"));
                    // cobolCodePD.append(INDENT)
                            // .append("MOVE ").append(rhs).append(" TO ").append(targetVar).append(insideblock?"\n":".\n");
                }
            }
            return;
        }
        else if(text.matches("^\\s*(?:String\\[\\]\\s+)?\\w+\\s*=\\s*\\w+\\.split\\(\"[^\"]+\"\\)\\s*;?\\s*$")){
            String[] parts = text.split("=");
            String lhs= parts[0].trim();
            String rhs = parts[1].replace(";","").trim();

            String varName = lhs.replaceAll("String\\[\\]\\s*", "").trim();
            if(!stringVars.contains(varName)){
                stringVars.add(varName);
            }
            Pattern splitPattern = Pattern.compile("^(\\w+)\\.split\\(\"([^\"]+)\"\\)$");
            Matcher matcher = splitPattern.matcher(rhs);
            if (matcher.find()) {
                String sourceVar = matcher.group(1); // e.g., input
                String delimiter = matcher.group(2); // e.g., "-"
                // Estimate number of splits (you can tune this or parse sample input if available)
                int estimatedParts = 5;
                //-------------Important note is above ☝️ we need to get the map of array sizes from data division and then update estimated parts by that value.
                // Generate INTO part: parts(1), parts(2), ...
                StringBuilder intoClause = new StringBuilder();
                for (int i = 1; i <= estimatedParts; i++) {
                    intoClause.append(varName).append("(").append(i).append(")");
                    if (i < estimatedParts) intoClause.append(", ");
                }

                // Emit COBOL UNSTRING
                emitCobol((INDENT)
                    +("UNSTRING ")+(sourceVar)
                    +(" DELIMITED BY \"")+(delimiter)+("\"")
                    +(" INTO ")+(intoClause.toString())
                    +(insideblock ? "\n" : ".\n"));
                // cobolCodePD.append(INDENT)
                //     .append("UNSTRING ").append(sourceVar)
                //     .append(" DELIMITED BY \"").append(delimiter).append("\"")
                //     .append(" INTO ").append(intoClause.toString())
                //     .append(insideblock ? "\n" : ".\n");
            }
            return;
        }
        else if(text.matches(".*=\\s*(\"[^\"]*\"|'[^']*'|\\w+(\\([^)]*\\))?)(\\s*\\+\\s*(\"[^\"]*\"|'[^']*'|\\w+(\\([^)]*\\))?))*\\s*;?") && stringVars.contains(cleanedVar)){
            // System.out.println("Hello guruvugaru "+text);
            boolean append = text.contains("+=");
            String[] parts=null;
            if(!append){
                parts =text.split("=");
            }
            else{
                parts=text.split("\\+=");
            }
            if(parts.length==2){
                String lhs = parts[0].trim();
                String[] lhsTokens = lhs.split("\\s+");
                String targetVar = lhsTokens[lhsTokens.length-1];
                // if (!stringVars.contains(targetVar)) {
                //     return; // here it is trivial as by default it is present
                // }
                String rhs=parts[1].replace(";", "").trim();
                String[] rhsOperands = rhs.split("\\+");
                for(int i=0;i<rhsOperands.length;i++){
                    rhsOperands[i] =rhsOperands[i].trim();
                }
                emitCobol((INDENT)+("STRING "));
                // cobolCodePD.append(INDENT).append("STRING ");
                if(append){
                    emitCobol((targetVar)+(" DELIMITED BY SPACE \n"));
                    // cobolCodePD.append(targetVar).append(" DELIMITED BY SPACE \n");
                }
                for(int i=0;i<rhsOperands.length-1;i++){
                    // if(rhsOperands[i].equals("\" \"")){
                    //     cobolCodePD.append(INDENT).append(rhsOperands[i]).append("\n");
                    // }
                    // else
                    String delimiter = ((rhsOperands[i].startsWith("\"") && rhsOperands[i].endsWith("\"") || 
                                                rhsOperands[i].startsWith("'") && rhsOperands[i].endsWith("'"))) 
                                    ? " DELIMITED BY SIZE \n" : " DELIMITED BY SPACE \n";
                    emitCobol((INDENT)+(rhsOperands[i])+(delimiter));
                    // cobolCodePD.append(INDENT).append(rhsOperands[i]).append(" DELIMITED BY SPACE \n");
                }
                String lastDelimiter = ((rhsOperands[rhsOperands.length-1].startsWith("\"") && rhsOperands[rhsOperands.length-1].endsWith("\"") || 
                                                rhsOperands[rhsOperands.length-1].startsWith("'") && rhsOperands[rhsOperands.length-1].endsWith("'"))) 
                                    ? " DELIMITED BY SIZE INTO " : " DELIMITED BY SPACE INTO ";
                emitCobol((INDENT)+(rhsOperands[rhsOperands.length-1])+(lastDelimiter)+(targetVar)+(insideblock?"\n":".\n"));
                // cobolCodePD.append(" DELIMITED BY SPACE INTO ").append(targetVar).append(insideblock?"\n":".\n");
            }
            return;
        }

        //char conversion
        text = expandCompoundAssignments(text);
        text = convertCharExpressions(text);
        System.out.println("Text after char conversion: " + text);
        if (text.matches("^\\s*\\w+\\s*=\\s*FUNCTION\\s+CHAR\\(.*\\);?$")) {
            String[] parts = text.split("=");
            if (parts.length == 2) {
                String lhsFull = parts[0].trim();
                String[] lhsTokens = lhsFull.split("\\s+");
                String lhs = lhsTokens[lhsTokens.length - 1];  // Extract only the variable name
                String rhs = parts[1].replace(";", "").trim();
                emitCobol((INDENT)
                    +("MOVE ")+(rhs)+(" TO ")+(lhs)+(insideblock ? "\n" : ".\n"));
                // cobolCodePD.append(INDENT)
                //     .append("MOVE ").append(rhs).append(" TO ").append(lhs).append(insideblock ? "\n" : ".\n");
                return;
            }
        }
        
        // if(ctx.IF()!=null){
        //     JavaParser.ParExpressionContext parExpr=ctx.parExpression();
        //     String condition=extractCondition(parExpr);
        //     // cobolCodePD.append(INDENT).append("IF ").append(condition).append("\n");
        //     emitCobol(INDENT+"IF "+condition+"\n");
        //     blockStack.push("IF-"+currentIfLevel);
        //     ifStatementStack.push(braceDepth+1);
        //     currentIfLevel++;
        //     justEnteredIf=true;
        //     updateInsideBlock();

        //     JavaParser.StatementContext elseBranch=null;
        //     if(ctx.statement().size()>1){
        //         elseBranch=ctx.statement(1);
        //     }

        //     while(elseBranch!=null && elseBranch.IF()!=null){
        //         JavaParser.ParExpressionContext elseifExpr=elseBranch.parExpression();
        //         String elseifCondition=extractCondition(elseifExpr);
        //         // cobolCodePD.append(INDENT).append("ELSE\n");
        //         emitCobol(INDENT+"ELSE\n");
        //         // cobolCodePD.append(INDENT).append("IF ").append(elseifCondition).append("\n");
        //         emitCobol(INDENT+"IF "+elseifCondition+"\n");
        //         blockStack.push("IF-"+currentIfLevel);
        //         ifStatementStack.push(braceDepth+1);
        //         currentIfLevel++;
        //         justEnteredIf=true;
        //         updateInsideBlock();

        //         if(elseBranch.statement().size()>1){
        //             elseBranch=elseBranch.statement(1);
        //         }else{
        //             elseBranch=null;
        //         }
        //     }

        //     if(elseBranch!=null){
        //         // cobolCodePD.append(INDENT).append("ELSE\n");
        //         emitCobol(INDENT+"ELSE\n");
        //         blockStack.push("ELSE-"+currentIfLevel);
        //         updateInsideBlock();
        //     }
        //     return;
        // }

        // if (ctx.IF() != null) {
        //     // handle the main IF/ELSE chain
        //     JavaParser.StatementContext curIf = ctx;
        //     boolean first = true;
        //     List<JavaParser.StatementContext> openBlocks = new ArrayList<>();

        //     while (curIf != null && curIf.IF() != null) {
        //         JavaParser.ParExpressionContext parExpr = curIf.parExpression();
        //         String condition = extractCondition(parExpr);

        //         if (first) {
        //             emitCobol(INDENT + "IF " + condition + "\n");
        //             blockStack.push("IF-" + currentIfLevel);
        //             currentIfLevel++;
        //             updateInsideBlock();
        //             first = false;
        //         } else {
        //             emitCobol(INDENT + "ELSE\n");
        //             emitCobol(INDENT + "IF " + condition + "\n");
        //             blockStack.push("IF-" + currentIfLevel);
        //             currentIfLevel++;
        //             updateInsideBlock();
        //         }
        //         // Only process the THEN branch
        //         if (curIf.statement().size() > 0) {
        //             JavaParser.StatementContext thenBranch = curIf.statement(0);
        //             if (thenBranch != null && !(thenBranch.getText().equals("{}") || thenBranch.getChildCount() == 0)) {
        //                 if (thenBranch.block() != null) {
        //                     for (JavaParser.BlockStatementContext blockStmt : thenBranch.block().blockStatement()) {
        //                         if (blockStmt.statement() != null) {
        //                             enterStatement(blockStmt.statement());
        //                         }
        //                     }
        //                 } else {
        //                     enterStatement(thenBranch);
        //                 }
        //             }
        //         }
        //         // If the else branch is another if (else-if), continue the chain
        //         if (curIf.statement().size() > 1 && curIf.statement(1).IF() != null) {
        //             curIf = curIf.statement(1);
        //         } else {
        //             break;
        //         }
        //     }

        //     // Handle the final ELSE branch (if present and not an else-if)
        //     if (curIf != null && curIf.statement().size() > 1 && curIf.statement(1).IF() == null) {
        //         emitCobol(INDENT + "ELSE\n");
        //         blockStack.push("ELSE-" + currentIfLevel);
        //         currentIfLevel++;
        //         updateInsideBlock();
        //         JavaParser.StatementContext elseBranch = curIf.statement(1);
        //         if (elseBranch != null && !(elseBranch.getText().equals("{}") || elseBranch.getChildCount() == 0)) {
        //             if (elseBranch.block() != null) {
        //                 for (JavaParser.BlockStatementContext blockStmt : elseBranch.block().blockStatement()) {
        //                     if (blockStmt.statement() != null) {
        //                         enterStatement(blockStmt.statement());
        //                     }
        //                 }
        //             } else {
        //                 enterStatement(elseBranch);
        //             }
        //         }
        //     }
        //     return;
        // }

        if(text.startsWith("System.exit")){
            emitCobol((INDENT)+("STOP RUN")+(insideblock?"\n":".\n"));
            // cobolCodePD.append(INDENT).append("STOP RUN").append(insideblock?"\n":".\n");
        }
        else if(text.equals("break;") && switchStack.empty()){
            emitCobol((INDENT)+("EXIT PERFORM")+(insideblock?"\n":".\n"));
        }
        else if(text.equals("continue;")){
            emitCobol((INDENT)+("EXIT PERFORM CYCLE")+(insideblock?"\n":".\n"));
        }
        else if(text.startsWith("return ") && text.endsWith(";")){
            String retExpr = text.substring(7, text.length() - 1).trim();
            String retVal = translateArgumentExpression(retExpr);
            if (currentMethod != null) {
                emitCobol(INDENT + "MOVE " + retVal + " TO "
                        + returnVariableForCurrentMethod() + "\n");
            }
            emitCobol((INDENT)+("EXIT PARAGRAPH")+(insideblock?"\n":".\n"));
        }
        else if(text.equals("return;")){
            emitCobol((INDENT)+("EXIT PARAGRAPH")+(insideblock?"\n":".\n"));
        }
        else if (text.matches(".*\\s*=\\s*(\"[^\"]*\"|'[^']*')\\s*;?")) {
            String[] parts = text.split("=", 2);
            if (parts.length == 2) {
                String lhs = parts[0].trim();
                String rhs = parts[1].replace(";", "").trim();
                String targetVar = lhs.replaceAll(".*\\s+", "").trim();
                emitCobol((INDENT)+("MOVE ")+(rhs)+(" TO ")+(targetVar)+(insideblock?"\n":".\n"));
            }
        }
        else if(text.matches(".*\\b(boolean)?\\s*\\w+\\s*=\\s*(true|false)\\s*;?")){
            //handles both boolean abc = true/false, abc = true/false
            String[] parts = text.split("=");
            if (parts.length == 2) {
                // Get variable name and assigned value
                String lhs = parts[0].trim();
                String[] lhsTokens = lhs.split("\\s+");
                String varName = lhsTokens[lhsTokens.length - 1].trim();

                String rhs = parts[1].replace(";", "").trim().toLowerCase();
                if(rhs.equals("true")){
                    emitCobol((INDENT)+("SET ")+(varName)+("-TRUE TO TRUE")+(insideblock?"\n":".\n"));
                    // cobolCodePD.append(INDENT).append("SET ").append(varName).append("-TRUE TO TRUE").append(insideblock?"\n":".\n");
                }
                else if (rhs.equals("false")) {
                    emitCobol((INDENT)+("SET ")+(varName)+("-FALSE TO FALSE")+(insideblock ? "\n" : ".\n"));
                    // cobolCodePD.append(INDENT).append("SET ").append(varName).append("-FALSE TO FALSE").append(insideblock ? "\n" : ".\n");
                }
            }
        }
        else if(text.matches(".*(?<![+\\-*/%])=\\s*\\w+\\s*[+\\-\\*/%]\\s*\\w+\\s*;?")){
            //Handle a=b+c or a=b-c or a=b*c or a=b/c or a=b%c
            String[] parts=text.split("=");
            if(parts.length==2){
                String lhs=parts[0].trim();
                String[] lhstokens=lhs.split("\\s+");
                String targetVar=lhstokens[lhstokens.length-1];

                String rhs=parts[1].replace(";", "").trim();
                int opPos = Math.max(Math.max(Math.max(rhs.indexOf('+'), rhs.indexOf('-')),Math.max(rhs.indexOf('*'),rhs.indexOf("/"))),rhs.indexOf("%"));
                char operator = rhs.charAt(opPos);
                String op1 = rhs.substring(0, opPos).trim();
                String op2 = rhs.substring(opPos + 1).trim();
                if(operator=='+'){
                    emitCobol((INDENT)+("ADD ")+(op1)+(" TO ")+(op2)+(" GIVING ")+(targetVar)+(insideblock?"\n":".\n"));
                    // cobolCodePD.append(INDENT).append("ADD ").append(op1).append(" TO ").append(op2).append(" GIVING ").append(targetVar).append(insideblock?"\n":".\n");
                }
                else if(operator=='-'){
                    emitCobol((INDENT)+("SUBTRACT ")+(op2)+(" FROM ")+(op1)+(" GIVING ")+(targetVar)+(insideblock?"\n":".\n"));
                    // cobolCodePD.append(INDENT).append("SUBTRACT ").append(op2).append(" FROM ").append(op1).append(" GIVING ").append(targetVar).append(insideblock?"\n":".\n");
                }
                else if(operator=='*'){
                    emitCobol((INDENT)+("MULTIPLY ")+(op1)+(" BY ")+(op2)+(" GIVING ")+(targetVar)+(insideblock?"\n":".\n"));
                    // cobolCodePD.append(INDENT).append("MULTIPLY ").append(op1).append(" BY ").append(op2).append(" GIVING ").append(targetVar).append(insideblock?"\n":".\n");
                }
                else if(operator=='/'){
                    emitCobol((INDENT)+("DIVIDE ")+(op1)+(" BY ")+(op2)+(" GIVING ")+(targetVar)+(insideblock?"\n":".\n"));
                    // cobolCodePD.append(INDENT).append("DIVIDE ").append(op1).append(" BY ").append(op2).append(" GIVING ").append(targetVar).append(insideblock?"\n":".\n");
                }
                else if(operator=='%'){
                    String quotientTemp = newTemp();
                    emitCobol((INDENT)+("DIVIDE ")+(op1)+(" BY ")+(op2)+(" GIVING ")+(quotientTemp)+(" REMAINDER ")+(targetVar)+(insideblock?"\n":".\n"));
                }
            }
        }
        else if (text.matches("\\w+\\s*\\+=\\s*\\w+\\s*;?") || text.matches("\\w+\\s*-=\\s*\\w+\\s*;?") || text.matches("\\w+\\s*\\*=\\s*\\w+\\s*;?") || text.matches("\\w+\\s*/=\\s*\\w+\\s*;?") || text.matches("\\w+\\s*%=\\s*\\w+\\s*;?")) {
            // Handle a += b or a -= b or a*=b or a/=b or a%=b
            String operator = text.contains("+=") ? "+" : (text.contains("-=")? "-" : (text.contains("*=")? "*" : (text.contains("/=")? "/": "%")));
            String[] parts=null;
            if(operator.equals("+")){
                parts = text.split("\\+=");
            }
            else if(operator.equals("-")){
                parts = text.split("\\-=");
            }
            else if(operator.equals("*")){
                parts = text.split("\\*=");
            }
            else if(operator.equals("/")){
                parts = text.split("\\/=");
            }
            else if(operator.equals("%")){
                parts = text.split("\\%=");
            }
            if (parts.length == 2) {
                String targetVar = parts[0].trim();
                String operand = parts[1].replace(";", "").trim();
                if(operator.equals("+")){
                    emitCobol((INDENT)+("ADD ")+(operand)+(" TO ")+(targetVar)+(insideblock?"\n":".\n"));
                    // cobolCodePD.append(INDENT).append("ADD ").append(operand).append(" TO ").append(targetVar).append(insideblock?"\n":".\n");
                }
                else if(operator.equals("-")){
                    emitCobol((INDENT)+("SUBTRACT ")+(operand)+(" FROM ")+(targetVar)+(insideblock?"\n":".\n"));
                    // cobolCodePD.append(INDENT).append("SUBTRACT ").append(operand).append(" FROM ").append(targetVar).append(insideblock?"\n":".\n");
                }
                else if(operator.equals("*")){
                    emitCobol((INDENT)+("MULTIPLY ")+(operand)+(" BY ")+(targetVar)+(insideblock?"\n":".\n"));
                    // cobolCodePD.append(INDENT).append("MULTIPLY ").append(operand).append(" BY ").append(targetVar).append(insideblock?"\n":".\n");
                }
                else if(operator.equals("/")){
                    emitCobol((INDENT)+("DIVIDE ")+(operand)+(" INTO ")+(targetVar)+(insideblock?"\n":".\n"));
                    // cobolCodePD.append(INDENT).append("DIVIDE ").append(operand).append(" INTO ").append(targetVar).append(insideblock?"\n":".\n");
                }
                else if(operator.equals("%")){
                    String quotientTemp = newTemp();
                    emitCobol((INDENT)+("DIVIDE ")+(targetVar)+(" BY ")+(operand)+(" GIVING ")+(quotientTemp)+(" REMAINDER ")+(targetVar)+(insideblock?"\n":".\n"));
                }
            }
        }
        else if (text.matches("\\+\\+\\w+\\s*;?") || text.matches("\\-\\-\\w+\\s*;?")) {
            // Handle ++a or --a
            char op=text.charAt(0);
            String var = text.replaceAll("[+;\\-;]", "").trim();
            if(op=='+'){
                emitCobol((INDENT)+("ADD ")+("1 TO ")+(var)+(insideblock?"\n":".\n"));
            }
            else if(op=='-'){
                emitCobol((INDENT)+("SUBTRACT ")+("1 FROM ")+(var)+(insideblock?"\n":".\n"));
                // cobolCodePD.append(INDENT).append("SUBTRACT ").append("1 FROM ").append(var).append(insideblock?"\n":".\n");
            }
        }
        else if (text.matches("\\w+\\+\\+\\s*;?") || text.matches("\\w+\\-\\-\\s*;?")) {
            // Handle a++ or a--
            char op = text.charAt(text.indexOf('+') != -1 ? text.indexOf('+') : text.indexOf('-'));
            String var = text.replaceAll("[+;\\-;]", "").trim();
            if(op=='+'){
                emitCobol((INDENT)+("ADD ")+("1 TO ")+(var)+(insideblock?"\n":".\n"));
                // cobolCodePD.append(INDENT).append("ADD ").append("1 TO ").append(var).append(insideblock?"\n":".\n");
            }
            else if(op=='-'){
                emitCobol((INDENT)+("SUBTRACT ")+("1 FROM ")+(var)+(insideblock?"\n":".\n"));
                // cobolCodePD.append(INDENT).append("SUBTRACT ").append("1 FROM ").append(var).append(insideblock?"\n":".\n");
            }
        }
        else if (text.matches("\\w+\\s*=\\s*\\w+\\+\\+\\s*;?") || text.matches("\\w+\\s*=\\s*\\w+\\-\\-\\s*;?")) {
            // Handle b = a++ or b = a--
            String[] parts = text.split("=");
            if (parts.length == 2) {
                String lhs = parts[0].trim(); // b
                String rhs = parts[1].replace(";", "").replace("++", "").replace("--","").trim(); // a
                String op = parts[1].replace(";", "").trim();
                op = op.substring(op.length()-1);
                emitCobol((INDENT)+("MOVE ")+(rhs)+(" TO ")+(lhs)+(insideblock?"\n":".\n"));
                // cobolCodePD.append(INDENT).append("MOVE ").append(rhs).append(" TO ").append(lhs).append(insideblock?"\n":".\n");
                if(op.equals("+")){
                    emitCobol((INDENT)+("ADD ")+("1 TO ")+(rhs)+(insideblock?"\n":".\n"));
                    // cobolCodePD.append(INDENT).append("ADD ").append("1 TO ").append(rhs).append(insideblock?"\n":".\n");
                }
                else if(op.equals("-")){
                    emitCobol((INDENT)+("SUBTRACT ")+("1 FROM ")+(rhs)+(insideblock?"\n":".\n"));
                    // cobolCodePD.append(INDENT).append("SUBTRACT ").append("1 FROM ").append(rhs).append(insideblock?"\n":".\n");
                }
            }
        }
        else if (text.matches("\\w+\\s*=\\s*\\+\\+\\w+\\s*;?") || text.matches("\\w+\\s*=\\s*\\-\\-\\w+\\s*;?")) {
            // Handle b = ++a or b = --a
            String[] parts = text.split("=");
            if (parts.length == 2) {
                String lhs = parts[0].trim(); // b
                String rhs = parts[1].replace(";", "").replace("++", "").replace("--","").trim(); // a
                String op = parts[1].replace(";", "").trim();
                op = op.substring(0,1);
                if(op.equals("+")){
                    emitCobol((INDENT)+("ADD ")+("1 TO ")+(rhs)+(insideblock?"\n":".\n"));
                    // cobolCodePD.append(INDENT).append("ADD ").append("1 TO ").append(rhs).append(insideblock?"\n":".\n");
                }
                else if(op.equals("-")){
                    emitCobol((INDENT)+("SUBTRACT ")+("1 FROM ")+(rhs)+(insideblock?"\n":".\n"));
                    // cobolCodePD.append(INDENT).append("SUBTRACT ").append("1 FROM ").append(rhs).append(insideblock?"\n":".\n");
                }
                emitCobol((INDENT)+("MOVE ")+(rhs)+(" TO ")+(lhs)+(insideblock?"\n":".\n"));
                // cobolCodePD.append(INDENT).append("MOVE ").append(rhs).append(" TO ").append(lhs).append(insideblock?"\n":".\n");
            }
        }
        else if(text.matches("\\s*((?:\\w+|\\w+\\s*\\(.*?\\)))\\s*([+\\-*/%]=)\\s*(?:[^;]*(?:FUNCTION\\s+[\\w-]+\\([^)]*\\)|[+\\-*/%])[^;]*|[^;]+);?")){
            // for the arithmetic expressions mapped to compute, this is for a+=arithmetic expression.
            String[] parts = text.split("=", 2);
            if (parts.length == 2) {
                String targetVar = parts[0].trim();
                String rhs = parts[1].replace(";", "").trim();
            
                List<String> preOps = new ArrayList<>();
                List<String> postOps = new ArrayList<>();
            
                Pattern prePattern = Pattern.compile("(\\+\\+|--)(\\w+(?:\\([^()]*\\))?)");
                Matcher preMatcher = prePattern.matcher(rhs);
                StringBuffer sbPre = new StringBuffer();
                while (preMatcher.find()) {
                    String op = preMatcher.group(1);
                    String var = preMatcher.group(2);
                    preOps.add((op.equals("++") ? "ADD 1 TO " : "SUBTRACT 1 FROM ") + var + ".");
                    preMatcher.appendReplacement(sbPre, var);
                }
                preMatcher.appendTail(sbPre);
                rhs = sbPre.toString();
            
                Pattern postPattern = Pattern.compile("(\\w+(?:\\([^()]*\\))?)(\\+\\+|--)");
                Matcher postMatcher = postPattern.matcher(rhs);
                StringBuffer sbPost = new StringBuffer();
                while (postMatcher.find()) {
                    String var = postMatcher.group(1);
                    String op = postMatcher.group(2);
                    postOps.add((op.equals("++") ? "ADD 1 TO " : "SUBTRACT 1 FROM ") + var + ".");
                    postMatcher.appendReplacement(sbPost, var);
                }
                postMatcher.appendTail(sbPost);
                rhs = sbPost.toString();
            
                // 🔥 NEW: HANDLE MODULO HERE
                // rhs = stripRedundantParens(rhs);
                rhs = reduceExpression(rhs);
            
                for (String pre : preOps) {
                    emitCobol(INDENT + pre + "\n");
                }
            
                emitCobol(INDENT
                        + "COMPUTE "
                        + targetVar
                        + " = "
                        + rhs
                        + (insideblock ? "\n" : ".\n"));
                
                for (String post : postOps) {
                    emitCobol(INDENT + post + "\n");
                }
            }
        }
        else if (text.matches(".*\\s*=\\s*\"[^\"]*\"\\s*;?" ) || text.matches(".*\\s*=\\s*'[^']*'\\s*;?")) {
            String[] parts = text.split("=", 2);
            if (parts.length == 2) {
                String lhs = parts[0].trim();
                String rhs = parts[1].replace(";", "").trim();
                emitCobol((INDENT) + ("MOVE ") + (rhs) + (" TO ") + (lhs) + (insideblock ? "\n" : ".\n"));
            }
        }
        else if (text.matches("\\s*[\\w()\\s+\\-*/%]+\\s*=\\s*[^;]+;?")) {
            String[] parts = text.split("=", 2);
            if (parts.length == 2) {
                String lhs = parts[0].trim();
                String rhs = parts[1].replace(";", "").trim();
            
                String targetVar = lhs;
            
                List<String> preOps = new ArrayList<>();
                List<String> postOps = new ArrayList<>();
            
                // Pre ++ / --
                Pattern prePattern = Pattern.compile("(\\+\\+|--)(\\w+(?:\\([^()]*\\))?)");
                Matcher preMatcher = prePattern.matcher(rhs);
                StringBuffer sbPre = new StringBuffer();
                while (preMatcher.find()) {
                    String op = preMatcher.group(1);
                    String var = preMatcher.group(2);
                    preOps.add((op.equals("++") ? "ADD 1 TO " : "SUBTRACT 1 FROM ") + var + ".");
                    preMatcher.appendReplacement(sbPre, var);
                }
                preMatcher.appendTail(sbPre);
                rhs = sbPre.toString();
            
                // Post ++ / --
                Pattern postPattern = Pattern.compile("(\\w+(?:\\([^()]*\\))?)(\\+\\+|--)");
                Matcher postMatcher = postPattern.matcher(rhs);
                StringBuffer sbPost = new StringBuffer();
                while (postMatcher.find()) {
                    String var = postMatcher.group(1);
                    String op = postMatcher.group(2);
                    postOps.add((op.equals("++") ? "ADD 1 TO " : "SUBTRACT 1 FROM ") + var + ".");
                    postMatcher.appendReplacement(sbPost, var);
                }
                postMatcher.appendTail(sbPost);
                rhs = sbPost.toString();
            
                if ((rhs.startsWith("\"") && rhs.endsWith("\"")) || (rhs.startsWith("'") && rhs.endsWith("'"))) {
                    emitCobol(INDENT + "MOVE " + rhs + " TO " + targetVar + (insideblock ? "\n" : ".\n"));
                    return;
                }

                rhs = reduceExpression(rhs);
            
                if (!hasArithmetic(rhs) && !rhs.contains("(") && !rhs.contains(")") && !rhs.contains("+") && !rhs.contains("-") && !rhs.contains("*") && !rhs.contains("/") && !rhs.contains("%")) {
                    emitCobol(INDENT + "MOVE " + rhs + " TO " + targetVar + (insideblock ? "\n" : ".\n"));
                    return;
                }

            
                emitCobol(INDENT
                        + "COMPUTE "
                        + targetVar
                        + " = "
                        + rhs
                        + (insideblock ? "\n" : ".\n"));
                
                for (String post : postOps) {
                    emitCobol(INDENT + post + "\n");
                }
            }
        }
        

        
        
        // if(text.trim().startsWith("if(") || text.contains("if(") || text.matches(".*if\\s*\\(.*")) {
        //     String condition = extractConditionFromText(text);
        //     cobolCodePD.append(INDENT).append("IF ").append(condition).append("\n");
            
        //     blockStack.push("IF-" + currentIfLevel);
        //     ifStatementStack.push(braceDepth + 1); // Track the brace level where this IF should close
        //     currentIfLevel++;
        //     justEnteredIf = true;
            
        //     // Check if this IF statement has an else clause by looking at the full context
        //     String fullContext = getFullStatementContext(ctx);
        //     expectingElse = fullContext.contains("}else{") || fullContext.contains("} else {") || 
        //                 fullContext.contains("}else ") || fullContext.matches(".*}\\s*else\\s+[^i].*");
        //     elseExpectedStack.push(expectingElse);
            
        //     updateInsideBlock();
        //     return;
        // }
                // String text = tokens.getText(ctx);
        // if (text.trim().startsWith("if(") || text.contains("if(") || text.matches(".*if\\s*\\(.*")) {
        //     String condition = extractConditionFromText(text);
        //     cobolCodePD.append(INDENT).append("IF ").append(condition).append("\n");
        //     blockStack.push("IF");
        //     updateInsideBlock();
        //     return;
        // }
    }
    @Override
    public void enterStatement(JavaParser.StatementContext ctx){
        addLeadingComments(ctx);
        String text=tokens.getText(ctx);
        
        ParseTree parent = ctx.getParent();
        if (parent instanceof JavaParser.StatementContext) {
            JavaParser.StatementContext parentStmt = (JavaParser.StatementContext) parent;
            if (parentStmt.IF() != null
                && parentStmt.statement().size() > 1
                && parentStmt.statement(1) == ctx) {
                // Only emit ELSE if this is not an 'else if'
                if (ctx.IF() == null) {
                    emitCobol(INDENT + "ELSE\n");
                    updateInsideBlock();
                }
            }
        }

        if (ctx.IF() != null) {
            // Check if this IF is a direct child of another IF's else branch
            // ParseTree parent = ctx.getParent();
            if (parent instanceof JavaParser.StatementContext) {
                JavaParser.StatementContext parentStmt = (JavaParser.StatementContext) parent;
                if (parentStmt.IF() != null
                    && parentStmt.statement().size() > 1
                    && parentStmt.statement(1) == ctx) {
                    // We are an else or else-if branch: emit ELSE
                    emitCobol(INDENT + "ELSE\n");
                    updateInsideBlock();
                }
            }
            // Now emit the IF as usual
            String condition = extractCondition(ctx.parExpression());
            emitCobol(INDENT + "IF " + condition + "\n");
            blockStack.push("IF-" + currentIfLevel);
            currentIfLevel++;
            updateInsideBlock();
            justEnteredIf = true;
            return;
        }

        // Handling for loop statements
        
            if (ctx.FOR() != null) {
                JavaParser.ForControlContext forControl = ctx.forControl();

                // ---- Fix 1.7: detect enhanced-for (for-each) ----
                if (forControl != null && forControl.enhancedForControl() != null) {
                    JavaParser.EnhancedForControlContext efc = forControl.enhancedForControl();

                    // The loop variable (e.g. "x" in "for (int x : arr)")
                    String loopVar   = efc.variableDeclaratorId().getText();
                    // The iterable expression (e.g. "arr")
                    String iterExpr  = tokens.getText(efc.expression());

                    // We need a size variable. Convention: iterExpr + "-SIZE" in WORKING-STORAGE.
                    // For arrays mapped with OCCURS we use the array group name.
                    // Emit a PERFORM VARYING over an index, then MOVE arr(IDX) TO loopVar at body start.
                    String idxVar    = loopVar + "-IDX";
                    String sizeVar   = iterExpr  + "-MAX";   // must exist in DATA DIVISION

                    // Emit: PERFORM VARYING loopVar-IDX FROM 1 BY 1 UNTIL loopVar-IDX > iterExpr-SIZE
                    emitCobol(INDENT + "PERFORM VARYING " + idxVar
                        + " FROM 1 BY 1 UNTIL " + idxVar + " > " + sizeVar + "\n");
                    // First statement of the body must be: MOVE iterExpr(IDX) TO loopVar
                    emitCobol(INDENT + "    MOVE " + iterExpr + "(" + idxVar + ") TO " + loopVar + "\n");

                    blockStack.push("FOR");
                    forLoopRecomputeStack.push(new ArrayList<>());
                    updateInsideBlock();
                    insideblock = true;
                    return;
                }

                // ---- Standard counted for-loop (unchanged from original) ----
                String varName = null, fromValue = null, untilCond = "", update = "";
                int byValue = 1;
                boolean increment = true;

                if (forControl != null) {
                    if (forControl.forInit() != null) {
                        String init = tokens.getText(forControl.forInit());
                        Matcher m = Pattern.compile("(?:int|long|short|var)?\\s*(\\w+)\\s*=\\s*([\\w\\d+-]+)").matcher(init);
                        if (m.find()) {
                            varName = m.group(1);
                            fromValue = m.group(2);
                            forLoopInitVars.add(varName);
                        }
                    }
                    if (forControl.expression() != null && varName != null) {
                        String cond = tokens.getText(forControl.expression());
                        ConditionResult cr = translateConditionWithTemps(cond);
                        for (String stmt : cr.precomputeStatements) {
                            emitCobol(INDENT + stmt + "\n");
                        }
                        untilCond = "NOT (" + cr.condition + ")";
                        forLoopRecomputeStack.push(new ArrayList<>(cr.recomputeStatements));
                    } else {
                        forLoopRecomputeStack.push(new ArrayList<>());
                    }
                    if (forControl.getChildCount() >= 5 && varName != null) {
                        update = forControl.getChild(4).getText();
                        if (update.contains("++")) {
                            byValue = 1; increment = true;
                        } else if (update.contains("--")) {
                            byValue = 1; increment = false;
                        } else {
                            Matcher um = Pattern.compile(varName + "\\s*([+\\-]=)\\s*(\\d+)").matcher(update);
                            if (um.find()) {
                                byValue = Integer.parseInt(um.group(2));
                                increment = um.group(1).equals("+=");
                            }
                        }
                    }
                }
                if (varName != null && fromValue != null && !untilCond.isEmpty()) {
                    emitCobol(INDENT + "PERFORM VARYING " + varName + " FROM " + fromValue
                        + " BY " + (increment ? byValue : -byValue) + " UNTIL " + untilCond + "\n");
                    blockStack.push("FOR");
                    updateInsideBlock();
                    insideblock = true;
                }
                insideForLoopHeader = false;
                return;
            }

        // Handling DO-WHILE Loop

        if(ctx.DO()!=null){

            JavaParser.ParExpressionContext parExpr = ctx.parExpression();
            String condText = tokens.getText(parExpr.expression());

            ConditionResult cr = translateConditionWithTemps(condText);

            // no precompute (condition checked AFTER body)

            doWhileRecomputeStack.push(new ArrayList<>(cr.recomputeStatements));
            doWhileCondStack.push(cr.condition);

            emitCobol(INDENT + "PERFORM WITH TEST AFTER\n");

            blockStack.push("DOWHILE");
            updateInsideBlock();
            return;
        }


        // Handling WHILE Loop

        if(ctx.WHILE()!=null){
            JavaParser.ParExpressionContext parExpr=ctx.parExpression();
           if (ctx.WHILE() != null) {

                String cond = tokens.getText(ctx.parExpression().expression());

                // TEMP-aware lowering
                ConditionResult cr = translateConditionWithTemps(cond);

                // precompute temps BEFORE loop
                for (String stmt : cr.precomputeStatements) {
                    emitCobol(INDENT + stmt + "\n");
                }

                String untilCondition = "NOT (" + cr.condition + ")";

                emitCobol(INDENT + "PERFORM UNTIL " + untilCondition + "\n");

                blockStack.push("WHILE");
                whileRecomputeStack.push(new ArrayList<>(cr.recomputeStatements));

                updateInsideBlock();
                return;
            }

            updateInsideBlock();
            return;
        }
        
        statementTranslation(text);
        if (ctx.SWITCH() != null) {

            String rawExpr = ctx.getChild(1).getText()
                                .replace("(", "")
                                .replace(")", "");

            String switchVar = translateSwitchExpression(rawExpr);

            emitCobol(INDENT + "EVALUATE " + switchVar + "\n");

            switchStack.push(true);
            updateInsideBlock();
        }

       
        
    }

    public void exitStatement(JavaParser.StatementContext ctx){
        String text = tokens.getText(ctx);

        // End of a while block

        // if(!blockStack.isEmpty() && blockStack.peek().startsWith("WHILE:")){
        //     if(text.contains("}")){
        //         String whileEntry=blockStack.pop();
        //         String untilCondition=whileEntry.substring(6);
        //         cobolCodePD.append(INDENT).append("UNTIL ").append(untilCondition);

        //         if(blockStack.isEmpty()){
        //             cobolCodePD.append(".");
        //         }

        //         cobolCodePD.append("\n");
        //         updateInsideBlock();
        //         return;
        //     }
        // }

        // do-while block

        if(ctx.DO()!=null && !blockStack.isEmpty() && blockStack.peek().equals("DOWHILE")){

            // recompute temps BEFORE END-PERFORM condition check
            if(!doWhileRecomputeStack.isEmpty()){
                List<String> recompute = doWhileRecomputeStack.pop();
                for(String stmt : recompute){
                    emitCobol(INDENT + stmt + "\n");
                }
            }

            String cond = doWhileCondStack.pop();

            emitCobol(INDENT + "END-PERFORM UNTIL NOT (" + cond + ")\n");

            blockStack.pop();
            updateInsideBlock();
            return;
        }


        if (ctx.WHILE() != null && !blockStack.isEmpty() && blockStack.peek().equals("WHILE")) {

            //  recompute temps before next iteration
            if (!whileRecomputeStack.isEmpty()) {
                List<String> recompute = whileRecomputeStack.pop();
                for (String stmt : recompute) {
                    emitCobol(INDENT + stmt + "\n");
                }
            }

            emitCobol(INDENT + "END-PERFORM\n");
            blockStack.pop();
            updateInsideBlock();
            return;
        }


        // int closingBraces = 0;
        // for (char c : text.toCharArray()) {
        //     if (c == '}') {
        //         closingBraces++;
        //         braceDepth--;
        //     }
        // }

        // while (closingBraces > 0 && !blockStack.isEmpty()) {
        //     // Only pop IF/ELSE blocks for closure
        //     if (blockStack.peek().startsWith("IF") || blockStack.peek().startsWith("ELSE")) {
        //         emitCobol(INDENT + "END-IF");
        //         boolean isOutermost = (blockStack.size() == 1);
        //         blockStack.pop();
        //         if (isOutermost && (blockStack.isEmpty() || !(blockStack.peek().startsWith("IF") || blockStack.peek().startsWith("ELSE")))) {
        //             emitCobol(".");
        //         }
        //         emitCobol("\n");
        //         currentIfLevel--;
        //         updateInsideBlock();
        //     }
        //     closingBraces--;
        // }

        // if (ctx.IF() != null) {
        //     // Check for ELSE/ELSE-IF
        //     if (ctx.statement().size() > 1) {
        //         JavaParser.StatementContext elseBranch = ctx.statement(1);
        //         if (elseBranch.IF() != null) {
        //             // else if
        //             emitCobol(INDENT + "ELSE\n");
        //             // Don't push new blockStack for ELSE-IF; it's another IF, will be handled by its own enter/exit
        //         } else {
        //             // plain else
        //             emitCobol(INDENT + "ELSE\n");
        //             blockStack.push("ELSE-" + currentIfLevel);
        //             currentIfLevel++;
        //             updateInsideBlock();
        //         }
        //     }
        //     // Always close the opened IF (and possible ELSE)
        //     while (!blockStack.isEmpty() &&
        //         (blockStack.peek().startsWith("IF") || blockStack.peek().startsWith("ELSE"))) {
        //         emitCobol(INDENT + "END-IF\n");
        //         blockStack.pop();
        //         currentIfLevel--;
        //         updateInsideBlock();
        //     }
        //     return;
        // }


        
        // i// ------------ Currently commenting but this is a part of working code for future reference ------------f (ctx.IF() != null) {
        //     // Only close the IF we opened for this node
        //     if (!blockStack.isEmpty() && blockStack.peek().startsWith("IF")) {
        //         emitCobol(INDENT + "END-IF\n");
        //         blockStack.pop();
        //         currentIfLevel--;
        //         updateInsideBlock();
        //     }
        //     // Do NOT emit ELSE or try to pop/close ELSE here!
        //     return;
        // }

        // Handle SWITCH block termination
        if (ctx.SWITCH() != null) {
            // cobolCodePD.append(INDENT).append("END-EVALUATE.\n");
            
            if (!switchStack.isEmpty()) {
                switchStack.pop();
            }
            updateInsideBlock();
            emitCobol(INDENT+"END-EVALUATE"+(insideblock?"\n":".\n"));
        }

        // handling for statements
// ------------ Currently commenting but this is a part of working code for future reference ------------
        // if (!blockStack.isEmpty() && blockStack.peek().equals("FOR")) {
        //     if (text.endsWith("}")) {
        //         // cobolCodePD.append(INDENT).append("END-PERFORM.\n");
        //         emitCobol(INDENT+"END-PERFORM.\n");
        //         blockStack.pop();
        //         updateInsideBlock();
        //         insideblock = !blockStack.isEmpty();
        //         forLoopInitVars.clear();
        //     }
        // }
        // forLoopInitVars.clear();    // clear the loop initialised variables to ensure proper reuse of the set declared.

        // int closingBraces = 0;
        // for (char c : text.toCharArray()) {
        //     if (c == '}') {
        //         closingBraces++;
        //         // braceDepth--;
        //     }
        // }
        // while(closingBraces>0 && !blockStack.isEmpty()){
        //     String blockType=blockStack.pop();
        //     if(blockType.startsWith("IF")){
        //         emitCobol(INDENT+"END-IF\n");
        //         currentIfLevel--;
        //     }else if(blockType.startsWith("FOR")){
        //         emitCobol(INDENT+"END-PERFORM\n");
        //         forLoopInitVars.clear();
        //     }
        //     updateInsideBlock();
        //     closingBraces--;    
        // }
            if (ctx.IF() != null && !blockStack.isEmpty() && blockStack.peek().contains("IF")) {
                emitCobol(INDENT + "END-IF\n");
                blockStack.pop();
                return;
            }
            if (ctx.FOR() != null && !blockStack.isEmpty() && blockStack.peek().equals("FOR")) {

                // recompute condition temps BEFORE END-PERFORM
                if (!forLoopRecomputeStack.isEmpty()) {
                    List<String> recompute = forLoopRecomputeStack.pop();
                    for (String stmt : recompute) {
                        emitCobol(INDENT + stmt + "\n");
                    }
                }

                emitCobol(INDENT + "END-PERFORM\n");
                blockStack.pop();
                return;
            }

    }

    // @Override
    // public void exitBlock(JavaParser.BlockContext ctx){
    //     if(!blockStack.isEmpty() && blockStack.peek().startsWith("WHILE:")){
    //         String whileEntry=blockStack.pop();
    //         String untilCondition=whileEntry.substring(6);
    //         cobolCodePD.append(INDENT).append("UNTIL ").append(untilCondition);

    //         if(blockStack.isEmpty()){
    //             cobolCodePD.append(".");
    //         }

    //         cobolCodePD.append("\n");
    //         updateInsideBlock();
    //     }
    // }

    private boolean isWhileLoopEnd(JavaParser.StatementContext ctx){
        String text=tokens.getText();

        if(text.contains("}") && !blockStack.isEmpty() && blockStack.peek().startsWith("WHILE:")){
            return true;
        }

        ParserRuleContext parent=ctx.getParent();
        while(parent!=null){
            if(parent instanceof JavaParser.StatementContext){
                JavaParser.StatementContext parentStmt=(JavaParser.StatementContext) parent;
                if(parentStmt.WHILE()!=null){
                    return true;
                }
            }
            parent=parent.getParent();
        }
        return false;
    }

    // private void processStatementDirectly(JavaParser.StatementContext ctx) {
    //     if (ctx.expressionStatement() != null) {
    //         // Handle expression statements directly
    //         JavaParser.ExpressionContext expr = ctx.expressionStatement().expression();
    //         if (expr != null) {
    //             processExpression(expr);  // Your existing expression processing
    //         }
    //     } else if (ctx.localVariableDeclarationStatement() != null) {
    //         // Handle variable declarations directly
    //         processVariableDeclaration(ctx.localVariableDeclarationStatement());
    //     }
    //     // Add other statement types as needed, but avoid re-processing IF statements
    // }

    private String getFullStatementText(JavaParser.StatementContext ctx) {
        try {
            if (ctx.getParent() != null) {
                return tokens.getText(ctx.getParent());
            }
        } catch (Exception e) {
            System.err.println("Error getting full statement text: " + e.getMessage());
        }
        return tokens.getText(ctx);
    }



    private String getRemainingCodeAfterIf(JavaParser.StatementContext ctx){
        try{
            if(ctx.getParent()!=null){
                String parentText=tokens.getText(ctx.getParent());
                int currentPos=parentText.indexOf(tokens.getText());
                if(currentPos>=0){
                    return parentText.substring(currentPos+tokens.getText(ctx).length());
                }
            }
        }catch(Exception e){

        }
        return "";
    }

    private String getNextStatement(JavaParser.StatementContext ctx) {
        try {
            int stopIndex = ctx.getStop().getTokenIndex();
            StringBuilder nextText = new StringBuilder();
            
            // Look ahead for the next few tokens
            for (int i = 1; i <= 20 && stopIndex + i < tokens.size(); i++) {
                Token token = tokens.get(stopIndex + i);
                if (token != null) {
                    String tokenText = token.getText().trim();
                    if (!tokenText.isEmpty()) {
                        nextText.append(tokenText).append(" ");
                        
                        // Stop when we find else or another statement
                        if (tokenText.equals("else") || tokenText.equals("{") || tokenText.equals(";")) {
                            break;
                        }
                    }
                }
            }
            
            return nextText.toString().trim();
        } catch (Exception e) {
            System.err.println("Error getting next statement: " + e.getMessage());
            return null;
        }
    }

    private String getNextNonWhitespaceText(JavaParser.StatementContext ctx) {
        try {
            int stopIndex = ctx.getStop().getTokenIndex();
            StringBuilder nextText = new StringBuilder();
            
            // Look ahead for meaningful tokens, skipping whitespace
            for (int i = 1; i <= 30 && stopIndex + i < tokens.size(); i++) {
                Token token = tokens.get(stopIndex + i);
                if (token != null) {
                    String tokenText = token.getText().trim();
                    // Skip whitespace and newlines
                    if (tokenText.isEmpty() || tokenText.equals("\n") || tokenText.equals("\r")) {
                        continue;
                    }
                    
                    nextText.append(tokenText).append(" ");
                    
                    // Stop when we have enough context or hit a statement terminator
                    if (tokenText.equals("else") || tokenText.equals("{") || tokenText.equals(";") || 
                        nextText.length() > 50) {
                        break;
                    }
                }
            }
            
            String result = nextText.toString().trim();
            System.out.println("Next non-whitespace text: '" + result + "'");
            return result;
        } catch (Exception e) {
            System.err.println("Error getting next non-whitespace text: " + e.getMessage());
            return null;
        }
    }

    private boolean isTopLevelStatement(ParserRuleContext ctx){
        ParserRuleContext parent=ctx.getParent();
        if(parent==null){
            return true;
        }
        String parentClass=parent.getClass().getSimpleName();
        return parentClass.equals("BlockContext") && parent.getParent() != null &&
        (parent.getParent().getClass().getSimpleName().equals("MethodBodyContext") ||
         parent.getParent().getClass().getSimpleName().equals("ClassBodyDeclarationContext")); 
    }

    private List<String> splitArguments(String arguments) {
        List<String> result = new ArrayList<>();
        if (arguments.trim().isEmpty()) {
            return result;
        }

        int depth = 0;
        boolean inString = false;
        char quote = 0;
        StringBuilder current = new StringBuilder();
        for (int i = 0; i < arguments.length(); i++) {
            char ch = arguments.charAt(i);
            if ((ch == '\'' || ch == '"') && (i == 0 || arguments.charAt(i - 1) != '\\')) {
                if (!inString) {
                    inString = true;
                    quote = ch;
                } else if (quote == ch) {
                    inString = false;
                }
            } else if (!inString) {
                if (ch == '(') {
                    depth++;
                } else if (ch == ')') {
                    depth--;
                } else if (ch == ',' && depth == 0) {
                    result.add(current.toString().trim());
                    current.setLength(0);
                    continue;
                }
            }
            current.append(ch);
        }
        result.add(current.toString().trim());
        return result;
    }

    /** Lowers calls to Java methods with a return value into PERFORM and RETURN-* references. */
    private String processExpressionWithCalls(String expression) {
        String lowered = replaceObjFieldRefs(expression == null ? "" : expression.trim());

        Matcher instanceCall = Pattern.compile("^(\\w+)\\.(\\w+)\\s*\\(([^()]*)\\)$").matcher(lowered);
        if (instanceCall.matches()) {
            String objectName = instanceCall.group(1);
            String methodName = instanceCall.group(2);
            String className = objectVariables.get(objectName);
            if (className != null && classInfoMap.containsKey(className)) {
                ClassInfoExtractor.MethodInfo method = classInfoMap.get(className).methods.stream()
                        .filter(candidate -> candidate.name.equals(methodName)
                                && !"void".equals(candidate.returnType))
                        .findFirst()
                        .orElse(null);
                if (method != null) {
                    String classPrefix = className.toUpperCase();
                    String instanceRecord = classPrefix + "-" + objectName.toUpperCase() + "-INST";
                    emitCobol(INDENT + "MOVE " + instanceRecord + " TO " + classPrefix + "-OBJ\n");
                    List<String> arguments = splitArguments(instanceCall.group(3));
                    for (int i = 0; i < Math.min(arguments.size(), method.paramNames.size()); i++) {
                        String argument = translateArgumentExpression(
                                processExpressionWithCalls(arguments.get(i)));
                        emitCobol(INDENT + "MOVE " + argument + " TO "
                                + oopParameterName(className, methodName, method.paramNames.get(i)) + "\n");
                    }
                    emitCobol(INDENT + "PERFORM " + classPrefix + "-"
                            + methodName.toUpperCase() + "-PARA\n");
                    emitCobol(INDENT + "MOVE " + classPrefix + "-OBJ TO " + instanceRecord + "\n");
                    return "RETURN-" + classPrefix + "-" + methodName.toUpperCase();
                }
            }
        }

        Pattern innerCall = Pattern.compile("([a-zA-Z_][a-zA-Z0-9_]*)\\s*\\(([^()]*)\\)");

        while (true) {
            Matcher matcher = innerCall.matcher(lowered);
            StringBuffer replacement = new StringBuffer();
            boolean foundReturningCall = false;

            while (matcher.find()) {
                String methodName = matcher.group(1);
                if (!returnVars.containsKey(methodName)) {
                    matcher.appendReplacement(replacement, Matcher.quoteReplacement(matcher.group()));
                    continue;
                }

                List<String> arguments = splitArguments(matcher.group(2));
                List<String> parameters = methodParameters.getOrDefault(methodName, Collections.emptyList());
                for (int i = 0; i < Math.min(arguments.size(), parameters.size()); i++) {
                    String argument = processExpressionWithCalls(arguments.get(i));
                    argument = translateArgumentExpression(argument);
                    emitCobol(INDENT + "MOVE " + argument + " TO " + parameters.get(i) + "\n");
                }
                emitCobol(INDENT + "PERFORM " + methodName + "-PARA\n");
                matcher.appendReplacement(replacement, Matcher.quoteReplacement("RETURN-" + methodName));
                foundReturningCall = true;
            }
            matcher.appendTail(replacement);
            lowered = replacement.toString();
            if (!foundReturningCall) {
                return lowered;
            }
        }
    }

    private boolean handleAssignmentWithMethodCalls(String text) {
        Matcher assignment = Pattern.compile("^\\s*(?:[a-zA-Z_][a-zA-Z0-9_<>\\[\\]]*\\s+)?([a-zA-Z_][a-zA-Z0-9_]*(?:\\([^)]*\\))?)\\s*=\\s*(.+?);?\\s*$").matcher(text);
        if (!assignment.matches() || text.contains("==") || text.contains("!=")) {
            return false;
        }

        String target = assignment.group(1);
        if (stringVars.contains(target)) {
            return false;
        }
        String rhs = assignment.group(2).trim();
        String lowered = processExpressionWithCalls(rhs);
        if (lowered.equals(rhs)) {
            return false;
        }

        if (hasArithmetic(lowered)) {
            emitCobol(INDENT + "COMPUTE " + target + " = " + lowered + (insideblock ? "\n" : ".\n"));
        } else {
            emitCobol(INDENT + "MOVE " + lowered + " TO " + target + (insideblock ? "\n" : ".\n"));
        }
        return true;
    }
    
    //-----------------Helper function for DISPLAY based statements----------------
    private String processDisplayExpression(String expr) {
        expr = replaceObjFieldRefs(stripJavaCasts(expr).trim());

        // Convert String method calls and FUNCTION references before anything else.
        expr = intrinsicFunctionConverter.accomodateIntrinsicFunctions(expr);

        // Literal string
        if (expr.startsWith("\"") && expr.endsWith("\"")) {
            return expr;
        }

        String lowered = processExpressionWithCalls(expr);
        if (!lowered.equals(expr)) {
            if (!hasArithmetic(lowered)) {
                return lowered;
            }
            String temp = newTemp();
            statementTranslation(temp + " = " + lowered + ";");
            return temp;
        }

        // Variable or FUNCTION expression with no arithmetic
        if (!hasArithmetic(expr)) {
            return replaceVarsWithCobolNames(expr);
        }

        // Arithmetic expression → temp
        String temp = newTemp();
        statementTranslation(temp + " = " + expr + ";");
        return temp;
    }
    
    private List<String> extractDisplayParts(String text) {
        int start = text.indexOf('(');
        if (start < 0) return null;

        int count = 1;
        int end = start + 1;

        while (end < text.length() && count > 0) {
            char ch = text.charAt(end);
            if (ch == '(') count++;
            else if (ch == ')') count--;
            end++;
        }

        if (count != 0) return null;

        String inner = text.substring(start + 1, end - 1);

        List<String> parts = new ArrayList<>();
        StringBuilder curr = new StringBuilder();
        int nested = 0;

        for (int i = 0; i < inner.length(); i++) {
            char ch = inner.charAt(i);

            if (ch == '(') nested++;
            if (ch == ')') nested--;

            if (ch == '+' && nested == 0) {
                String leftSide = curr.toString().trim();
                int peek = i + 1;
                while (peek < inner.length() && inner.charAt(peek) == ' ') peek++;
                char nextCh = peek < inner.length() ? inner.charAt(peek) : 0;
                boolean leftIsString = leftSide.startsWith("\"");
                boolean rightIsString = nextCh == '"';
                if (leftIsString || rightIsString) {
                    parts.add(leftSide);
                    curr.setLength(0);
                } else {
                    curr.append(ch);
                }
            } else {
                curr.append(ch);
            }
        }

        if (curr.length() > 0) {
            parts.add(curr.toString().trim());
        }

        return parts;
    }



    //-------------------Switch case implementation--------------------
    @Override
    public void enterSwitchLabel(JavaParser.SwitchLabelContext ctx){
        addLeadingComments(ctx);
        if(ctx.CASE()!=null){
            String label = ctx.getChild(1).getText();
            emitCobol((INDENT)+("WHEN ")+(label)+("\n"));
            // cobolCodePD.append(INDENT).append("WHEN ").append(label).append("\n");
        }
        else if(ctx.DEFAULT()!=null){
            emitCobol((INDENT)+("WHEN OTHER\n"));
            // cobolCodePD.append(INDENT).append("WHEN OTHER\n");
        }
    }
    //-------------------Helper function to process the comments--------------------
    private void addLeadingComments(ParserRuleContext ctx){
        List<Token> hiddenTokens = ((CommonTokenStream) tokens).getHiddenTokensToLeft(ctx.getStart().getTokenIndex());
        if (hiddenTokens != null) {
            for (Token token : hiddenTokens) {
                String text = token.getText().trim();
                if (text.startsWith("//") || text.startsWith("/*")) {
                    // Remove comment symbols and format it
                    text = text.replaceAll("(^//|^/\\*|\\*/$)", "").trim();
                    emitCobol((INDENT_COMMENT)+("* ")+(text)+("\n"));
                    // cobolCodePD.append(INDENT_COMMENT).append("* ").append(text).append("\n");
                }
            }
        }
    }
    //------------------Helper function to process the arrays-------------------------
    public String convertArrayAccessToCobol(String text) {
        // ---- Fix 1.6: handle both 1D arr[i] and 2D matrix[i][j] ----
        // Strategy: repeatedly replace the LAST remaining [...] bracket pair
        // so that matrix[i][j] → matrix[i](j+1) → matrix(i+1, j+1)

        // First pass: collapse all consecutive [] into a single COBOL (d1, d2, ...) subscript
        // Pattern matches: word followed by one or more [expr] groups
        Pattern multiDimPattern = Pattern.compile("(\\w+)((?:\\s*\\[[^\\]]+\\])+)");
        Matcher mdMatcher = multiDimPattern.matcher(text);
        StringBuffer sb = new StringBuffer();

        while (mdMatcher.find()) {
            String arrayName = mdMatcher.group(1);
            String allBrackets = mdMatcher.group(2); // e.g. "[i][j]" or "[0][1][2]"

            // Extract each index expression
            Pattern bracketPat = Pattern.compile("\\[([^\\]]+)\\]");
            Matcher bm = bracketPat.matcher(allBrackets);
            List<String> indices = new ArrayList<>();
            while (bm.find()) {
                indices.add(bm.group(1).trim());
            }

            // Convert each index: literal → +1, expression → expr + 1
            StringBuilder cobolSubscript = new StringBuilder();
            for (int idx = 0; idx < indices.size(); idx++) {
                if (idx > 0) cobolSubscript.append(", ");
                String indexExpr = indices.get(idx);
                try {
                    int literal = Integer.parseInt(indexExpr);
                    cobolSubscript.append(literal + 1);
                } catch (NumberFormatException e) {
                    // Normalize spacing
                    String spaced = indexExpr.replaceAll("\\s*", "");
                    spaced = spaced.replaceAll("([+\\-*/()])", " $1 ");
                    spaced = spaced.replaceAll("\\s+", " ").trim();
                    cobolSubscript.append(spaced).append(" + 1");
                }
            }

            mdMatcher.appendReplacement(sb,
                Matcher.quoteReplacement(arrayName + "(" + cobolSubscript + ")"));
        }

        mdMatcher.appendTail(sb);
        return sb.toString();
    }

    //-------------------Helper function for chars------------------------
    private String convertCharExpressions(String text) {
        String[] ops = {"="};  // Already handled += → =
        // System.out.println(text+"&&&&&&&&");
        for (String op : ops) {
            if (text.contains(op)) {
                String[] parts = text.split(Pattern.quote(op), 2);
                if (parts.length < 2) return text;

                String lhs = parts[0].trim();
                String rhs = parts[1].replaceAll(";", "").trim();
                String[] lhsParts = lhs.split("\\s+");
                String tarVar = lhsParts[lhsParts.length-1];

                // Remove cast like (char)(...) from rhs
                rhs = rhs.replaceAll("\\(char\\)", "").replaceAll("\\(char\\s*\\)", "");

                // Replace char literals: 'A' → FUNCTION ORD('A')
                rhs = rhs.replaceAll("'(.)'", "FUNCTION ORD($0)");
                System.out.println("RISHA LAB Permit brand-----------: "+lhs+" "+rhs+ parts[0]);
                // Replace char variable references with FUNCTION ORD(var)
                for (String var : charVariables) {
                    rhs = rhs.replaceAll("\\b" + Pattern.quote(var) + "\\b", "FUNCTION ORD(" + var + ")");
                }

                // Wrap RHS in FUNCTION CHAR if LHS is char variable
                if (charVariables.contains(tarVar)) {
                    rhs = "FUNCTION CHAR(" + rhs + ")";
                }

                return lhs + " " + op + " " + rhs + ";";
            }
        }
        return text;
    }


    private String expandCompoundAssignments(String text) {
        String[] ops = {"+=", "-=", "*=", "/=", "%="};
        // System.out.println("Inside the expCompAssing: "+text);
        for (String op : ops) {
            if (text.contains(op)) {
                String[] parts = text.split(Pattern.quote(op), 2);
                if (parts.length == 2) {
                    String lhs = parts[0].trim();
                    String rhs = parts[1].replaceAll(";", "").trim();
                    return lhs + " = " + lhs + " " + op.charAt(0) + " " + rhs + ";";
                }
            }
        }
        // System.out.println("While returning the expCompAssign: "+text);
        return text;
    }


    // helper functions for handling the if conditional statements

    private String getFullStatementContext(JavaParser.StatementContext ctx) {
        try {
            // Get more context by looking at parent or surrounding tokens
            if (ctx.getParent() != null) {
                return tokens.getText(ctx.getParent());
            }
            
            // Alternative: get a wider range of tokens around this statement
            int startIndex = Math.max(0, ctx.getStart().getTokenIndex() - 5);
            int stopIndex = Math.min(tokens.size() - 1, ctx.getStop().getTokenIndex() + 20);
            
            StringBuilder context = new StringBuilder();
            for (int i = startIndex; i <= stopIndex; i++) {
                Token token = tokens.get(i);
                if (token != null) {
                    context.append(token.getText());
                }
            }
            
            return context.toString();
        } catch (Exception e) {
            return tokens.getText(ctx);
        }
    }

    private void handleIfStatement(JavaParser.StatementContext ctx,String text){
        String condition=extractConditionFromText(text);
        // cobolCodePD.append(INDENT).append("IF ").append(condition).append("\n");
        emitCobol(INDENT+"IF "+condition+"\n");
        blockStack.push("IF-"+currentIfLevel);
        ifStatementStack.push(ctx.getStart().getTokenIndex());
        currentIfLevel++;
        updateInsideBlock();
    }

    private void handleIfStatementExit(JavaParser.StatementContext ctx, String text) {
        // Check if this is the end of an IF block by looking at the text pattern
        if (text.contains("}") && !ifStatementStack.isEmpty()) {
            // Count braces to determine if we're exiting an IF block
            int openBraces = 0;
            int closeBraces = 0;
            
            for (char c : text.toCharArray()) {
                if (c == '{') openBraces++;
                if (c == '}') closeBraces++;
            }
            
            // If we have more closing braces, we're likely exiting a block
            if (closeBraces > openBraces && !blockStack.isEmpty() && blockStack.peek().startsWith("IF")) {
                ifStatementStack.pop();
                // cobolCodePD.append(INDENT).append("END-IF");
                emitCobol(INDENT+"END-IF");
                if (blockStack.size() <= 1) {
                    // cobolCodePD.append(".");
                    emitCobol(".");
                }
                // cobolCodePD.append("\n");
                emitCobol("\n");
                blockStack.pop();
                currentIfLevel--;
                updateInsideBlock();
            }
        }
    }

    private static class IfElseChain{
        List<IfCondition>conditions=new ArrayList<>();
        boolean hasElse=false;
        String elseBody="";

        static class IfCondition{
            String condition;
            String body;
            boolean isElseIf;

            IfCondition(String condition,String body,boolean isElseIf){
                this.condition=condition;
                this.body=body;
                this.isElseIf=isElseIf;
            }
        }
    }

    private String extractCondition(JavaParser.ParExpressionContext ctx){
        if(ctx!=null && ctx.expression()!=null){
            String condition=tokens.getText(ctx.expression());
            return translateCondition(condition);
        }
        return "TRUE";
    }

    private String extractConditionFromText(String text) {
        String cleanText = text.trim();
        if (cleanText.startsWith("if(")) {
            int start = cleanText.indexOf('(');
            int end = findMatchingParenthesis(cleanText, start);
            if (start >= 0 && end > start) {
                String condition = cleanText.substring(start + 1, end);
                return translateCondition(condition);
            }
        }
        if (cleanText.contains("else if(")) {
            int elseIfPos = cleanText.indexOf("else if(");
            int start = cleanText.indexOf('(', elseIfPos);
            int end = findMatchingParenthesis(cleanText, start);
            if (start >= 0 && end > start) {
                String condition = cleanText.substring(start + 1, end);
                return translateCondition(condition);
            }
        }
        int ifPos = cleanText.indexOf("if");
        if (ifPos >= 0) {
            int start = cleanText.indexOf('(', ifPos);
            int end = findMatchingParenthesis(cleanText, start);
            if (start >= 0 && end > start) {
                String condition = cleanText.substring(start + 1, end);
                return translateCondition(condition);
            }
        }
        return "TRUE";
    }

    private int findMatchingParenthesis(String text, int start) {
        if (start < 0 || start >= text.length() || text.charAt(start) != '(') {
            return -1;
        }
        int count = 1;
        for (int i = start + 1; i < text.length(); i++) {
            char c = text.charAt(i);
            if (c == '(') {
                count++;
            } else if (c == ')') {
                count--;
                if (count == 0) {
                    return i;
                }
            }
        }
        return -1;
    }

    public String translateCondition(String conditionText) {

        conditionText = replaceObjFieldRefs(stripRedundantParens(stripJavaCasts(conditionText)));

        List<String> atomicExprs = extractAtomicExpressions(conditionText);
        Map<String, String> exprToTemp = new LinkedHashMap<>();

        for (String expr : atomicExprs) {

            // Split:  a+b*c   >=   2
            Matcher m = Pattern.compile("(.*?)(>=|<=|==|!=|>|<)(.*)").matcher(expr);
            if (!m.find()) continue;

            String lhsExpr = processExpressionWithCalls(m.group(1).trim());
            String operator = m.group(2);
            String rhsExpr = processExpressionWithCalls(m.group(3).trim());

            String lhsFinal = lhsExpr;

            // 🔥 ONLY create temp if needed
            if (hasArithmetic(lhsExpr) || lhsExpr.contains("(")) {
                String tempVar = newTemp();
                String assignment = tempVar + " = " + lhsExpr + ";";
                statementTranslation(assignment);
                lhsFinal = tempVar;
            }

            exprToTemp.put(expr, lhsFinal + " " + operator + " " + rhsExpr);
        }

        // rebuild condition
        String rewritten = conditionText;
        for (Map.Entry<String, String> e : exprToTemp.entrySet()) {
            rewritten = rewritten.replace(e.getKey(), e.getValue());
        }

        return rewritten
                .replace("&&", " AND ")
                .replace("||", " OR ")
                .replace("==", "=");
    }

    private List<String> extractAtomicExpressions(String cond) {
        List<String> result = new ArrayList<>();
        
        Matcher m = Pattern.compile(
            "([^&|]+?(>=|<=|==|!=|>|<)[^&|]+)"
        ).matcher(cond);
    
        while (m.find()) {
            result.add(m.group(1).trim());
        }
        return result;
    }
    private String extractRHS(String expr) {
        Matcher m = Pattern.compile("(.*?)(>=|<=|==|!=|>|<)").matcher(expr);
        if (m.find()) {
            return m.group(1).trim();
        }
        return expr.trim();
    }

    private String translateArgumentExpression(String argText) {

        // Same ordering rule as elsewhere: resolve this./obj.-qualified field
        // refs using their raw names FIRST, then run the generic bare-word
        // pass last, or a bare field name inside a qualified reference gets
        // rewritten before the qualified handler ever sees it.
        argText = replaceVarsWithCobolNames(replaceObjFieldRefs(replaceThisFieldRefs(
                stripJavaCasts(argText).trim())));

        String finalArg = argText;

        // Lower only if non-trivial expression
        if (hasArithmetic(argText) || argText.contains("(")) {

            String tempVar = newTemp();

            String assignment = tempVar + " = " + argText + ";";

            // Reuse full statement pipeline (COMPUTE, char ops, arrays, etc.)
            statementTranslation(assignment);

            finalArg = tempVar;
        }

        return finalArg;
    }


    private String translateSwitchExpression(String exprText) {

        String finalExpr = exprText;

        // Only lower if expression is non-trivial
        if (hasArithmetic(exprText) || exprText.contains("(")) {

            String tempVar = newTemp();

            // reuse existing statement logic
            String assignment = tempVar + " = " + exprText + ";";
            statementTranslation(assignment);

            finalExpr = tempVar;
        }

        return finalExpr;
    }


    private boolean hasElseClause(JavaParser.StatementContext ctx){
        if(ctx.getParent()!=null){
            String parentText=tokens.getText(ctx.getParent());
            return parentText.contains("else");
        }
        return false;
    }

    // ------ Helper for COMPUTE to handle % ----------

    public String reduceExpression(String expr) {
        if (expr == null) return "";
        expr = expr.trim();
        if ((expr.startsWith("\"") && expr.endsWith("\"")) || (expr.startsWith("'") && expr.endsWith("'"))) {
            return expr;
        }

        Stack<String> operands = new Stack<>();
        Stack<String> operators = new Stack<>();

        List<String> tokens = tokenize(expr);

        for (String tok : tokens) {

            if (isOperand(tok)) {
                operands.push(tok);
            }
            else if (tok.equals("(")) {
                operators.push(tok);
            }
            else if (tok.equals(")")) {
                while (!operators.peek().equals("(")) {
                    reduceTop(operands, operators);
                }
                operators.pop(); // remove '('
            }
            else { // operator
                while (!operators.isEmpty()
                        && !operators.peek().equals("(")
                        && precedence(operators.peek()) >= precedence(tok)) {
                    reduceTop(operands, operators);
                }
                operators.push(tok);
            }
        }

        while (!operators.isEmpty()) {
            reduceTop(operands, operators);
        }

        return operands.pop();
    }

    private void reduceTop(Stack<String> operands, Stack<String> operators) {

        String op = operators.pop();

        String right = operands.pop();
        String left  = operands.pop();

        left = reduceArithmeticToTemp(left);
        right = reduceArithmeticToTemp(right);

        if (op.equals("%")) {

            String q = newTemp();
            String r = newTemp();

            emitCobol(
                INDENT + "DIVIDE " + left + " BY " + right +
                " GIVING " + q + " REMAINDER " + r +
                (insideblock ? "\n" : ".\n")
            );

            operands.push(r);
        }
        else {
            String t = newTemp();
            emitCobol(
                INDENT + "COMPUTE " + t + " = " +
                left + " " + op + " " + right +
                (insideblock ? "\n" : ".\n")
            );
            operands.push(t);
        }
    }

    private List<String> tokenize(String expr) {

        List<String> tokens = new ArrayList<>();
        int i = 0;

        while (i < expr.length()) {

            char c = expr.charAt(i);

            // skip whitespace
            if (Character.isWhitespace(c)) {
                i++;
                continue;
            }

            // quoted literal
            if (c == '"' || c == '\'') {
                char quote = c;
                StringBuilder sb = new StringBuilder();
                sb.append(c);
                i++;
                while (i < expr.length()) {
                    char ch = expr.charAt(i);
                    sb.append(ch);
                    if (ch == quote) {
                        i++;
                        break;
                    }
                    i++;
                }
                tokens.add(sb.toString());
                continue;
            }

            // identifier or number
            if (Character.isLetterOrDigit(c) || c == '_') {
                StringBuilder sb = new StringBuilder();
                while (i < expr.length()) {
                    char ch = expr.charAt(i);
                    // Preserve generated upper-case COBOL data names such as
                    // COUNTER-OBJ-VALUE while keeping Java a-b as subtraction.
                    boolean cobolNameHyphen = ch == '-' && !sb.isEmpty()
                            && Character.isUpperCase(sb.charAt(0))
                            && i + 1 < expr.length()
                            && (Character.isUpperCase(expr.charAt(i + 1))
                                || Character.isDigit(expr.charAt(i + 1))
                                || expr.charAt(i + 1) == '_');
                    if (Character.isLetterOrDigit(ch) || ch == '_' || cobolNameHyphen) {
                        sb.append(ch);
                        i++;
                    } else break;
                }
                tokens.add(sb.toString());
                continue;
            }

            // operators and parentheses
            if ("+-*/%()".indexOf(c) != -1) {
                tokens.add(String.valueOf(c));
                i++;
                continue;
            }

            // ignore anything else safely
            i++;
        }

        return tokens;
    }

    private boolean isOperand(String s) {
        return !s.equals("+") && !s.equals("-")
            && !s.equals("*") && !s.equals("/")
            && !s.equals("%")
            && !s.equals("(") && !s.equals(")");
    }

    private int precedence(String op) {
        if (op.equals("%")) return 2;
        if (op.equals("*") || op.equals("/")) return 1;
        if (op.equals("+") || op.equals("-")) return 0;
        return -1;
    }

    private String stripRedundantParens(String s) {
        s = s.trim();
        while (s.startsWith("(") && s.endsWith(")")) {
            int depth = 0;
            boolean valid = true;
            for (int i = 0; i < s.length(); i++) {
                char c = s.charAt(i);
                if (c == '(') depth++;
                else if (c == ')') depth--;
                if (depth == 0 && i < s.length() - 1) {
                    valid = false;
                    break;
                }
            }
            if (!valid) break;
            s = s.substring(1, s.length() - 1).trim();
        }
        return s;
    }

    private ConditionResult translateConditionWithTemps(String conditionText) {

        conditionText = replaceObjFieldRefs(stripRedundantParens(stripJavaCasts(conditionText)));

        List<String> precompute = new ArrayList<>();
        List<String> recompute = new ArrayList<>();

        String rewritten = conditionText;

        String[] atomicExprs = conditionText.split("&&|\\|\\|");

        for (String expr : atomicExprs) {

            expr = expr.trim();

            Matcher m = Pattern.compile("(.*?)(>=|<=|==|!=|>|<)(.*)").matcher(expr);
            if (!m.find()) continue;

            String lhs = processExpressionWithCalls(m.group(1).trim());
            String op = m.group(2);
            String rhs = processExpressionWithCalls(m.group(3).trim());

            String lhsFinal = lhs;
            String rhsFinal = rhs;

            if (hasArithmetic(lhs) || lhs.contains("(")) {
                String t = newTemp();
                precompute.add("COMPUTE " + t + " = " + lhs);
                recompute.add("COMPUTE " + t + " = " + lhs);
                lhsFinal = t;
            }

            if (hasArithmetic(rhs) || rhs.contains("(")) {
                String t = newTemp();
                precompute.add("COMPUTE " + t + " = " + rhs);
                recompute.add("COMPUTE " + t + " = " + rhs);
                rhsFinal = t;
            }

            String newExpr = lhsFinal + " " + op + " " + rhsFinal;
            rewritten = rewritten.replace(expr, newExpr);
        }

        rewritten = rewritten
                .replace("&&", " AND ")
                .replace("||", " OR ")
                .replace("==", "=")
                .replace("!=", "NOT =");

        return new ConditionResult(rewritten.trim(), precompute, recompute);
    }



    private String reduceArithmeticToTemp(String expr) {
        expr = stripRedundantParens(expr);

        if (!hasArithmetic(expr)) {
            return expr;
        }

        String t = newTemp();
        emitCobol(
            INDENT + "COMPUTE " + t + " = " + expr +
            (insideblock ? "\n" : ".\n")
        );

        return t;
    }


}
