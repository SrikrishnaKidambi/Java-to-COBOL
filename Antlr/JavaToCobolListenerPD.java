import org.antlr.v4.runtime.TokenStream;

import java.net.IDN;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.swing.undo.StateEdit;

import org.antlr.v4.runtime.tree.TerminalNode;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;

public class JavaToCobolListenerPD extends JavaParserBaseListener{
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

    private final Map<String,Map<String,String>>methodVarNameMap=new HashMap<>();
    private final Map<String,String>globalVarNameMap=new HashMap<>();
    private String currentMethod=null;

    @Override
    public void enterMethodDeclaration(JavaParser.MethodDeclarationContext ctx){
        addLeadingComments(ctx);
        String methodName=ctx.identifier().getText();
        currentMethod=methodName;
        String methodPara=methodName.equals("main")?INDENT+"MAIN-PARA.":INDENT+methodName+"-PARA.";
        methodBuffer=new StringBuilder();
        currentMethodPara=methodPara;
        inMethod=true;
        methodVarNameMap.putIfAbsent(currentMethod, new HashMap<>());
        updateInsideBlock();
    }

    @Override
    public void exitMethodDeclaration(JavaParser.MethodDeclarationContext ctx){
        if(inMethod && methodBuffer!=null && currentMethodPara!=null){
            cobolCodePD.append('\n').append(currentMethodPara).append("\n").append(methodBuffer).append(INDENT).append("EXIT.\n");
            methodBuffer=null;
            currentMethodPara=null;
            inMethod=false;
            updateInsideBlock();
        }
        currentMethod=null;
    }

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
        return javaVar;
    }

    //**************************** //
    Set<String> stringVars = new HashSet<>();
    Set<String> charVariables = new HashSet<>();
    public JavaToCobolListenerPD(TokenStream tokens){
        this.tokens = tokens;
        cobolCodePD.append(INDENT).append("PROCEDURE DIVISION.\n\n");
    }
    public String getCobolCodePD(){
        cobolCodePD.append(INDENT).append("STOP RUN.\n");
        return cobolCodePD.toString();
    }
    //-----------Declaration types---------------
    @Override
    public void enterLocalVariableDeclaration(JavaParser.LocalVariableDeclarationContext ctx){
        // suppress the MOVE for variable declaration that is done inside the for loop.
        addLeadingComments(ctx);
        if(insideForLoopHeader){
            return;
        }

        String text=tokens.getText(ctx);
        System.out.println("Text before "+text);
        text = convertArrayAccessToCobol(text);
        System.out.println("Text after "+text);

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
                        emitCobol((INDENT)+(rhsOperands[i])+(" DELIMITED BY SPACE \n"));
                        // cobolCodePD.append(INDENT).append(rhsOperands[i]).append(" DELIMITED BY SPACE \n");
                    }
                    emitCobol((INDENT)+(rhsOperands[rhsOperands.length-1])+(" "));
                    // cobolCodePD.append(INDENT).append(rhsOperands[rhsOperands.length-1]).append(" ");
                    emitCobol((" DELIMITED BY SPACE INTO ")+(targetVar)+(insideblock?"\n":".\n"));
                    // cobolCodePD.append(" DELIMITED BY SPACE INTO ").append(targetVar).append(insideblock?"\n":".\n");
                }
            }
            return;
        }
        //convert according to char
        text = expandCompoundAssignments(text);
        text = convertCharExpressions(text);
        System.out.println("Text after char conversion: " + text);

        
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
                    emitCobol((INDENT)+("DIVIDE ")+(op1)+(" BY ")+(op2)+(" GIVING ")+(targetVar)+(" REMAINDER ")+(targetVar)+(insideblock?"\n":".\n"));
                    // cobolCodePD.append(INDENT).append("DIVIDE ").append(op1).append(" BY ").append(op2).append(" GIVING ").append(targetVar).append(" REMAINDER ").append(targetVar).append(insideblock?"\n":".\n");
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
                    emitCobol((INDENT)+("DIVIDE ")+(targetVar)+(" BY ")+(operand)+(" GIVING ")+(targetVar)+(" REMAINDER ")+(targetVar)+(insideblock?"\n":".\n"));
                    // cobolCodePD.append(INDENT).append("DIVIDE ").append(targetVar).append(" BY ").append(operand).append(" GIVING ").append(targetVar).append(" REMAINDER ").append(targetVar).append(insideblock?"\n":".\n");
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
        else if(text.matches("(int|float|double|long|short|var|char)?\\s*\\w+\\s*=\\s*[^;]*[+\\-*/%][^;]*;?")){
            String[] parts=text.split("=", 2);
            if(parts.length==2){
                String lhs=parts[0].trim();
                String[] lhsTokens =lhs.split("\\s+");
                String targetVar = lhsTokens[lhsTokens.length-1];

                String rhs=parts[1].replace(";", "").trim();

                List<String> preOps = new ArrayList<>();
                List<String> postOps = new ArrayList<>();

                // Pre-increment/decrement: ++x / --x
                Pattern prePattern = Pattern.compile("(\\+\\+|--)(\\w+)");
                Matcher preMatcher = prePattern.matcher(rhs);
                StringBuffer sbPre = new StringBuffer();
                while (preMatcher.find()) {
                    String op = preMatcher.group(1);
                    String var = preMatcher.group(2);
                    preOps.add((op.equals("++") ? "ADD 1 TO " : "SUBTRACT 1 FROM ") +  var + ".");
                    preMatcher.appendReplacement(sbPre, var);
                }
                preMatcher.appendTail(sbPre);
                rhs = sbPre.toString();

                // Post-increment/decrement: x++ / x--
                Pattern postPattern = Pattern.compile("(\\w+)(\\+\\+|--)");
                Matcher postMatcher = postPattern.matcher(rhs);
                StringBuffer sbPost = new StringBuffer();
                while (postMatcher.find()) {
                    String var = postMatcher.group(1);
                    String op = postMatcher.group(2);
                    postOps.add((op.equals("++") ? "ADD 1 TO " : "SUBTRACT 1 FROM ") +  var + ".");
                    postMatcher.appendReplacement(sbPost, var);
                }
                postMatcher.appendTail(sbPost);
                rhs = sbPost.toString();

                for(String pre:preOps){
                    System.out.println(pre);
                    emitCobol((INDENT)+(pre)+("\n"));
                    // cobolCodePD.append(INDENT).append(pre).append("\n");
                }
                emitCobol((INDENT)+("COMPUTE ")+(targetVar)+(" = ")+(rhs)+(insideblock?"\n":".\n"));
                // cobolCodePD.append(INDENT).append("COMPUTE ").append(targetVar).append(" = ").append(rhs).append(insideblock?"\n":".\n");

                for(String post:postOps){
                    emitCobol((INDENT)+(post)+("\n"));
                    // cobolCodePD.append(INDENT).append(post).append("\n");
                }
            }
        }
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

    //-----------------Statement types-------------------
    @Override
    public void enterStatement(JavaParser.StatementContext ctx){
        addLeadingComments(ctx);
        String text=tokens.getText(ctx);
        System.out.println("Text before "+text);
        //array conversion
        text = convertArrayAccessToCobol(text);
        System.out.println("Text after "+text);

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
                // insideForLoopHeader = true;

                JavaParser.ForControlContext forControl = ctx.forControl();
                String varName = null, fromValue = null, untilCond = "", update = "";
                int byValue = 1;
                boolean increment = true;

                if (forControl != null) {
                    // forInit (may be null)
                    if (forControl.forInit() != null) {
                        String init = tokens.getText(forControl.forInit());
                        Matcher m = Pattern.compile("(?:int|long|short|var)?\\s*(\\w+)\\s*=\\s*([\\w\\d+-]+)").matcher(init);
                        if (m.find()) {
                            varName = m.group(1);
                            fromValue = m.group(2);
                            forLoopInitVars.add(varName);
                        }
                    }
                    // condition
                    if (forControl.expression() != null && varName != null) {
                        String cond = tokens.getText(forControl.expression());
                        // Matcher cm = Pattern.compile(varName + "\\s*([<>=!]+)\\s*(.+)").matcher(cond);
                        // if (cm.find()) {
                        //     String op = cm.group(1), val = cm.group(2);
                        //     if (op.equals("<")) untilCond = varName + " >= " + val;
                        //     else if (op.equals("<=")) untilCond = varName + " > " + val;
                        //     else if (op.equals(">")) untilCond = varName + " <= " + val;
                        //     else if (op.equals(">=")) untilCond = varName + " < " + val;
                        //     else if (op.equals("==")) untilCond = varName + " NOT = " + val;
                        //     else if (op.equals("!=")) untilCond = varName + " = " + val;
                        // }
                        String cobolCond=translateCondition(cond);
                        untilCond="NOT ("+cobolCond+")";
                    }
                    // update: get the 5th child if present (structure: forInit ; expr ; update)
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
                // cobolCodePD.append(INDENT)
                //     .append("PERFORM VARYING ").append(varName)
                //     .append(" FROM ").append(fromValue)
                //     .append(" BY ").append(increment ? byValue : -byValue)
                //     .append(" UNTIL ").append(untilCond)
                //     .append("\n");
                emitCobol(INDENT+"PERFORM VARYING "+varName+" FROM "+fromValue+" BY "+(increment?byValue:-byValue)+" UNTIL "+untilCond+"\n");
                blockStack.push("FOR");
                updateInsideBlock();
                insideblock = true;
            }
            insideForLoopHeader = false;
            return;
        }

        // Handling DO-WHILE Loop

        if(ctx.DO()!=null){
            // cobolCodePD.append(INDENT).append("PERFORM WITH TEST AFTER\n");
            emitCobol(INDENT+"PERFORM WITH TEST AFTER\n");
            blockStack.push("DOWHILE");
            updateInsideBlock();
            return;
        }

        // Handling WHILE Loop

        if(ctx.WHILE()!=null){
            JavaParser.ParExpressionContext parExpr=ctx.parExpression();
            String condition=extractCondition(parExpr);
            String untilCondition="NOT ("+condition+")";

            // cobolCodePD.append(INDENT).append("PERFORM WITH TEST BEFORE\n");
            emitCobol(INDENT+"PERFORM UNTIL "+untilCondition+"\n");
            // blockStack.push("WHILE");
            blockStack.push("WHILE:"+untilCondition);
            updateInsideBlock();
            return;
        }

        // if(!isTopLevelStatement(ctx)){
        //     return;
        // }

        // String text=tokens.getText(ctx).trim();

        if(text.matches("^[a-zA-Z_][a-zA-Z0-9_]*\\s*\\(.*\\)\\s*;?$") && !text.contains("=")){
            String methodName=text.substring(0,text.indexOf('(')).trim().toUpperCase()+"-PARA";
            emitCobol(INDENT+"PERFORM "+methodName+"\n");
            return;
        }
        // System.out.println("Statement:"+text);

        for (char c : text.toCharArray()) {
            if (c == '{') braceDepth++;
        }
        addLeadingComments(ctx);
        
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
        
        if(text.startsWith("System.out.println") || text.startsWith("System.err.println")){
            String displayedContent=extractDisplayStatement(text);
            if(displayedContent!=null){
                // emitCobol(INDENT + "DISPLAY " + displayedContent + (insideblock?"\n":".\n"));
                String cobolContent=replaceVarsWithCobolNames(displayedContent);
                emitCobol(INDENT+"DISPLAY "+cobolContent+(insideblock?"\n":".\n"));
            }
            return;
        }
        else if(text.startsWith("System.out.print") || text.startsWith("System.err.print")){
            String displayedContent=extractDisplayStatement(text);
            if(displayedContent!=null){
                String cobolContent=replaceVarsWithCobolNames(displayedContent);
                emitCobol(INDENT + "DISPLAY " + cobolContent + " WITH NO ADVANCING" + (insideblock?"\n":".\n"));
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
        else if (text.matches("^(\\w+\\s+)?\\w+\\s*=\\s*(\"[^\"]*\"|'[^']*'|\\w+(\\([^)]*\\))?)\\s*;?$")) {
            // move statement mapping
            String[] parts = text.split("=");
            if (parts.length == 2) {
                String lhs = parts[0].trim();
                String[] lhsTokens = lhs.split("\\s+");
                String targetVar = lhsTokens[lhsTokens.length - 1]; // get variable name

                String rhs = parts[1].replace(";", "").trim();

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
                    emitCobol((INDENT)+(rhsOperands[i])+(" DELIMITED BY SPACE \n"));
                    // cobolCodePD.append(INDENT).append(rhsOperands[i]).append(" DELIMITED BY SPACE \n");
                }
                emitCobol((INDENT)+(rhsOperands[rhsOperands.length-1])+(" "));
                // cobolCodePD.append(INDENT).append(rhsOperands[rhsOperands.length-1]).append(" ");
                emitCobol((" DELIMITED BY SPACE INTO ")+(targetVar)+(insideblock?"\n":".\n"));
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
            // cobolCodePD.append(INDENT).append("EXIT PERFORM").append(insideblock?"\n":".\n");
        }
        else if(text.equals("return;")){
            emitCobol((INDENT)+("GOBACK")+(insideblock?"\n":".\n"));
            // cobolCodePD.append(INDENT).append("GOBACK").append(insideblock?"\n":".\n");
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
                    emitCobol((INDENT)+("DIVIDE ")+(op1)+(" BY ")+(op2)+(" GIVING ")+(targetVar)+(" REMAINDER ")+(targetVar)+(insideblock?"\n":".\n"));
                    // cobolCodePD.append(INDENT).append("DIVIDE ").append(op1).append(" BY ").append(op2).append(" GIVING ").append(targetVar).append(" REMAINDER ").append(targetVar).append(insideblock?"\n":".\n");
                }
            }
        }
        else if (text.matches("\\w+\\s*\\+=\\s*\\w+\\s*;?") || text.matches("\\w+\\s*-=\\s*\\w+\\s*;?") || text.matches("\\w+\\s*\\*=\\s*\\w+\\s*;?") || text.matches("\\w+\\s*/=\\s*\\w+\\s*;?") || text.matches("\\w+\\s*%=\\s*\\w+\\s*;?")) {
            // Handle a += b or a -= b or a*=b or a/=b or a%=b
            System.out.println("Hello sir "+text);
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
                    emitCobol((INDENT)+("DIVIDE ")+(targetVar)+(" BY ")+(operand)+(" GIVING ")+(targetVar)+(" REMAINDER ")+(targetVar)+(insideblock?"\n":".\n"));
                    // cobolCodePD.append(INDENT).append("DIVIDE ").append(targetVar).append(" BY ").append(operand).append(" GIVING ").append(targetVar).append(" REMAINDER ").append(targetVar).append(insideblock?"\n":".\n");
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
        else if(text.matches("\\s*((?:\\w+|\\w+\\s*\\(.*?\\)))\\s*([+\\-*/%]=)\\s*[^;]+;?")){
            // for the arithmetic expressions mapped to compute, this is for a+=arithmetic expression.
            String operator=text.contains("+=") ? "+" :
                            text.contains("-=") ? "-" :
                            text.contains("*=") ? "*" :
                            text.contains("/=") ? "/" :
                            "%";
            String[] parts = text.split(Pattern.quote(operator+"="),2);
            if(parts.length==2){
                String targetVar=parts[0].trim();
                String rhs=parts[1].replace(";", "").trim();

                //Handle pre and post increment/decrement
                List<String> preOps=new ArrayList<>();
                List<String> postOps=new ArrayList<>();

                // Pre-increment/decrement: ++x / --x
                Pattern prePattern = Pattern.compile("(\\+\\+|--)(\\w+(?:\\([^()]*\\))?)");
                Matcher preMatcher = prePattern.matcher(rhs);
                StringBuffer sbPre = new StringBuffer();
                while (preMatcher.find()) {
                    String op = preMatcher.group(1);
                    String var = preMatcher.group(2);
                    preOps.add((op.equals("++") ? "ADD 1 TO " : "SUBTRACT 1 FROM ") +  var + ".");
                    preMatcher.appendReplacement(sbPre, var);
                }
                preMatcher.appendTail(sbPre);
                rhs = sbPre.toString();

                // Post-increment/decrement: x++ / x--
                Pattern postPattern = Pattern.compile("(\\w+(?:\\([^()]*\\))?)(\\+\\+|--)");
                Matcher postMatcher = postPattern.matcher(rhs);
                StringBuffer sbPost = new StringBuffer();
                while (postMatcher.find()) {
                    String var = postMatcher.group(1);
                    String op = postMatcher.group(2);
                    postOps.add((op.equals("++") ? "ADD 1 TO " : "SUBTRACT 1 FROM ") +  var + ".");
                    postMatcher.appendReplacement(sbPost, var);
                }
                postMatcher.appendTail(sbPost);
                rhs = sbPost.toString();

                for(String pre:preOps){
                    emitCobol((INDENT)+(pre)+("\n"));
                    // cobolCodePD.append(INDENT).append(pre).append("\n");
                }
                emitCobol((INDENT)+("COMPUTE ")+(targetVar)+(" = ")+(targetVar)+(" ")+(operator)+(" ")+(rhs)+(insideblock?"\n":".\n"));
                // cobolCodePD.append(INDENT).append("COMPUTE ").append(targetVar).append(" = ").append(targetVar).append(" ").append(operator).append(" ").append(rhs).append(insideblock?"\n":".\n");

                for(String post:postOps){
                    emitCobol((INDENT)+(post)+("\n"));
                    // cobolCodePD.append(INDENT).append(post).append("\n");
                }
            }
        }
        else if (text.matches("\\s*[\\w()\\s+\\-*/%]+\\s*=\\s*[^;]+;?")) {
            String[] parts = text.split("=", 2);
            if (parts.length == 2) {
                String lhs = parts[0].trim();
                String rhs = parts[1].replace(";", "").trim();

                // LHS can be direct (e.g., x) or an array-style (e.g., arr(i + 1))
                String targetVar = lhs;

                List<String> preOps = new ArrayList<>();
                List<String> postOps = new ArrayList<>();

                // Handle pre-increment/decrement (++x / --x)
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

                // Handle post-increment/decrement (x++ / x--)
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

                // Emit COBOL code
                for (String pre : preOps) {
                    emitCobol((INDENT)+(pre)+("\n"));
                    // cobolCodePD.append(INDENT).append(pre).append("\n");
                }
                emitCobol((INDENT)
                        +("COMPUTE ")
                        +(targetVar)
                        +(" = ")
                        +(rhs)
                        +(insideblock ? "\n" : ".\n"));
                // cobolCodePD.append(INDENT)
                //         .append("COMPUTE ")
                //         .append(targetVar)
                //         .append(" = ")
                //         .append(rhs)
                //         .append(insideblock ? "\n" : ".\n");

                for (String post : postOps) {
                    emitCobol((INDENT)+(post)+("\n"));
                    // cobolCodePD.append(INDENT).append(post).append("\n");
                }
            }
        }

        else if(ctx.SWITCH()!=null){
            String switchVar = ctx.getChild(1).getText().replace("(", "").replace(")", "");
            emitCobol((INDENT)+("EVALUATE ")+(switchVar)+("\n"));
            // cobolCodePD.append(INDENT).append("EVALUATE ").append(switchVar).append("\n");
            switchStack.push(true);
            updateInsideBlock();
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

        if(ctx.DO()!=null){
            if(!blockStack.isEmpty() && blockStack.peek().equals("DOWHILE")){
                blockStack.pop();

                JavaParser.ParExpressionContext parExpr=ctx.parExpression();
                String condition=extractCondition(parExpr);
                String untilCondition="NOT ("+condition+")";
                // cobolCodePD.append(INDENT).append("UNTIL ").append(untilCondition);
                emitCobol(INDENT+"UNTIL "+untilCondition);
                if(blockStack.isEmpty()){
                    // cobolCodePD.append(".");
                    emitCobol(".");
                }
                // cobolCodePD.append("\n");
                emitCobol("\n");
                updateInsideBlock();
                return;
            }
        }

        // while block

        if(ctx.WHILE()!=null){
            if(!blockStack.isEmpty() && blockStack.peek().startsWith("WHILE:")){
                String whileEntry=blockStack.pop();
                String untilCondition=whileEntry.substring(6);
                // cobolCodePD.append(INDENT).append("UNTIL ").append(untilCondition);
                // emitCobol(INDENT+"UNTIL "+untilCondition);
                emitCobol(INDENT+"END-PERFORM\n");

                // if(blockStack.isEmpty()){
                //     // cobolCodePD.append(".");
                //     emitCobol(".");
                // }

                // cobolCodePD.append("\n");
                // emitCobol("\n");
                updateInsideBlock();
            }
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

        if (ctx.IF() != null) {
            // Only close the IF we opened for this node
            if (!blockStack.isEmpty() && blockStack.peek().startsWith("IF")) {
                emitCobol(INDENT + "END-IF\n");
                blockStack.pop();
                currentIfLevel--;
                updateInsideBlock();
            }
            // Do NOT emit ELSE or try to pop/close ELSE here!
            return;
        }

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

        if (!blockStack.isEmpty() && blockStack.peek().equals("FOR")) {
            if (text.endsWith("}")) {
                // cobolCodePD.append(INDENT).append("END-PERFORM.\n");
                emitCobol(INDENT+"END-PERFORM.\n");
                blockStack.pop();
                updateInsideBlock();
                insideblock = !blockStack.isEmpty();
                forLoopInitVars.clear();
            }
        }
        // forLoopInitVars.clear();    // clear the loop initialised variables to ensure proper reuse of the set declared.
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
    
    //-----------------Helper function for DISPLAY based statements----------------
    private String extractDisplayStatement(String text) {
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

        if (count != 0) return null; // Mismatched parentheses

        String inner = text.substring(start + 1, end - 1);

        // Process inner string to replace + with space only at top-level
        StringBuilder result = new StringBuilder();
        int nested = 0;

        for (int i = 0; i < inner.length(); i++) {
            char ch = inner.charAt(i);
            if (ch == '(') {
                nested++;
                result.append(ch);
            } else if (ch == ')') {
                nested--;
                result.append(ch);
            } else if (ch == '+' && nested == 0) {
                result.append(' '); // Replace + only at top level
            } else {
                result.append(ch);
            }
        }

        return result.toString();
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
        // Regex to match array access patterns like arr[0], matrix[i], etc.
        Pattern pattern = Pattern.compile("(\\w+)\\s*\\[([^\\]]+)]");
        Matcher matcher = pattern.matcher(text);
        StringBuffer sb = new StringBuffer();

        while (matcher.find()) {
            String arrayName = matcher.group(1);
            String indexExpr = matcher.group(2).trim();

            // Normalize spacing in expression (e.g., i+1 => i + 1)
            String spacedExpr = indexExpr.replaceAll("\\s*", ""); // Remove all whitespace
            spacedExpr = spacedExpr.replaceAll("([+\\-*/()])", " $1 "); // Add space around operators
            spacedExpr = spacedExpr.replaceAll("\\s+", " ").trim(); // Collapse multiple spaces

            // If index is a number, increment it
            try {
                int index = Integer.parseInt(indexExpr);
                matcher.appendReplacement(sb, arrayName + "(" + (index + 1) + ")");
            } catch (NumberFormatException e) {
                // Otherwise, add + 1 with spacing
                matcher.appendReplacement(sb, arrayName + "(" + spacedExpr + " + 1)");
            }
        }

        matcher.appendTail(sb);
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

    // //------------------INTRINSIC FUNTIONS--------------------------
    // public String accomodateIntrinsicFunctions(String text){
        
    // }


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

    private String translateCondition(String javaCondition) {
        String cobolCondition = javaCondition
            .replaceAll("==", "=")
            .replaceAll("!=", "NOT=")
            .replaceAll("<=", "<=")
            .replaceAll(">=", ">=")
            .replaceAll("<", "<")
            .replaceAll(">", ">")
            .replaceAll("&&", "AND")
            .replaceAll("\\|\\|", "OR")
            .replaceAll("!", "NOT")
            .replaceAll("\\(", "")
            .replaceAll("\\)", "");
        return cobolCondition.trim();
    }

    private boolean hasElseClause(JavaParser.StatementContext ctx){
        if(ctx.getParent()!=null){
            String parentText=tokens.getText(ctx.getParent());
            return parentText.contains("else");
        }
        return false;
    }
}