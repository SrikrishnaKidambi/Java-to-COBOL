import org.antlr.v4.runtime.TokenStream;

import java.net.IDN;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.antlr.v4.runtime.tree.TerminalNode;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.CommonTokenStream;

public class JavaToCobolListenerPD extends JavaParserBaseListener{
    private static final String INDENT="       ";
    private static final String INDENT_COMMENT="      ";
    private final TokenStream tokens;
    private final StringBuilder cobolCodePD = new StringBuilder();
    //*********Important************//
    private boolean insideSwitch=false;
    private boolean insideblock=false; // please add boolean for block type contructs and the use or to insideblock to handle the period logic
    private void updateInsideBlock(){
        insideblock=(insideSwitch);
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
        addLeadingComments(ctx);
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
            cobolCodePD.append(INDENT_COMMENT).append("* Input from ODT is enabled\n");
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

                String rhs = parts[1].replace(";", "").trim();

                // Match string/char literals or simple variables/literals
                if (rhs.matches("\"[^\"]*\"|'[^']*'|\\w+(\\([^)]*\\))?|[\\w\\d_]+")) {
                    cobolCodePD.append(INDENT)
                            .append("MOVE ").append(rhs).append(" TO ").append(targetVar).append(insideblock?"\n":".\n");
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
                int estimatedParts = 2;
                //-------------Important note is above ☝️ we need to get the map of array sizes from data division and then update estimated parts by that value.
                // Generate INTO part: parts(1), parts(2), ...
                StringBuilder intoClause = new StringBuilder();
                for (int i = 1; i <= estimatedParts; i++) {
                    intoClause.append(varName).append("(").append(i).append(")");
                    if (i < estimatedParts) intoClause.append(", ");
                }

                // Emit COBOL UNSTRING
                cobolCodePD.append(INDENT)
                    .append("UNSTRING ").append(sourceVar)
                    .append(" DELIMITED BY \"").append(delimiter).append("\"")
                    .append(" INTO ").append(intoClause.toString())
                    .append(insideblock ? "\n" : ".\n");
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
                    cobolCodePD.append(INDENT).append("STRING ");
                    if(append){
                        cobolCodePD.append(targetVar).append(" DELIMITED BY SPACE \n");
                    }
                    for(int i=0;i<rhsOperands.length-1;i++){
                        // if(rhsOperands[i].equals("\" \"")){
                        //     cobolCodePD.append(INDENT).append(rhsOperands[i]).append("\n");
                        // }
                        // else
                        cobolCodePD.append(INDENT).append(rhsOperands[i]).append(" DELIMITED BY SPACE \n");
                    }
                    cobolCodePD.append(INDENT).append(rhsOperands[rhsOperands.length-1]).append(" ");
                    cobolCodePD.append(" DELIMITED BY SPACE INTO ").append(targetVar).append(insideblock?"\n":".\n");
                }
            }
            return;
        }
        //convert according to char
        text = expandCompoundAssignments(text);
        text = convertCharExpressions(text);
        System.out.println("Text after char conversion: " + text);

        if (text.matches(".*=\\s*\\w+\\.next(Line|Int|Double|Float|Byte|Short|Long|Boolean)?\\s*\\(\\s*\\)\\s*;?")) {
            String[] parts = text.split("=");
            System.out.println(parts[0] + " and " + parts[1]);

            if (parts.length == 2) {
                String varDecl = parts[0].trim(); // e.g., "int b" or "name"
                String[] tokens = varDecl.split("\\s+"); // Split by whitespace
                String var = tokens[tokens.length - 1]; // Get variable name

                cobolCodePD.append(INDENT).append("ACCEPT ").append(var).append(insideblock?"\n":".\n");
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
                    cobolCodePD.append(INDENT).append("SET ").append(varName).append("-TRUE TO TRUE").append(insideblock?"\n":".\n");
                }
                else if (rhs.equals("false")) {
                    cobolCodePD.append(INDENT).append("SET ").append(varName).append("-FALSE TO FALSE").append(insideblock ? "\n" : ".\n");
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
                    cobolCodePD.append(INDENT).append("ADD ").append(op1).append(" TO ").append(op2).append(" GIVING ").append(targetVar).append(insideblock?"\n":".\n");
                }
                else if(operator=='-'){
                    cobolCodePD.append(INDENT).append("SUBTRACT ").append(op2).append(" FROM ").append(op1).append(" GIVING ").append(targetVar).append(insideblock?"\n":".\n");
                }
                else if(operator=='*'){
                    cobolCodePD.append(INDENT).append("MULTIPLY ").append(op1).append(" BY ").append(op2).append(" GIVING ").append(targetVar).append(insideblock?"\n":".\n");
                }
                else if(operator=='/'){
                    cobolCodePD.append(INDENT).append("DIVIDE ").append(op1).append(" BY ").append(op2).append(" GIVING ").append(targetVar).append(insideblock?"\n":".\n");
                }
                else if(operator=='%'){
                    cobolCodePD.append(INDENT).append("DIVIDE ").append(op1).append(" BY ").append(op2).append(" GIVING ").append(targetVar).append(" REMAINDER ").append(targetVar).append(insideblock?"\n":".\n");
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
                    cobolCodePD.append(INDENT).append("ADD ").append(operand).append(" TO ").append(targetVar).append(insideblock?"\n":".\n");
                }
                else if(operator.equals("-")){
                    cobolCodePD.append(INDENT).append("SUBTRACT ").append(operand).append(" FROM ").append(targetVar).append(insideblock?"\n":".\n");
                }
                else if(operator.equals("*")){
                    cobolCodePD.append(INDENT).append("MULTIPLY ").append(operand).append(" BY ").append(targetVar).append(insideblock?"\n":".\n");
                }
                else if(operator.equals("/")){
                    cobolCodePD.append(INDENT).append("DIVIDE ").append(operand).append(" INTO ").append(targetVar).append(insideblock?"\n":".\n");
                }
                else if(operator.equals("%")){
                    cobolCodePD.append(INDENT).append("DIVIDE ").append(targetVar).append(" BY ").append(operand).append(" GIVING ").append(targetVar).append(" REMAINDER ").append(targetVar).append(insideblock?"\n":".\n");
                }
            }
        }
        else if (text.matches("\\+\\+\\w+\\s*;?") || text.matches("\\-\\-\\w+\\s*;?")) {
            // Handle ++a or --a
            char op=text.charAt(0);
            String var = text.replaceAll("[+;\\-;]", "").trim();
            if(op=='+'){
                cobolCodePD.append(INDENT).append("ADD ").append("1 TO ").append(var).append(insideblock?"\n":".\n");
            }
            else if(op=='-'){
                cobolCodePD.append(INDENT).append("SUBTRACT ").append("1 FROM ").append(var).append(insideblock?"\n":".\n");
            }
        }
        else if (text.matches("\\w+\\+\\+\\s*;?") || text.matches("\\w+\\-\\-\\s*;?")) {
            // Handle a++ or a--
            char op = text.charAt(text.indexOf('+') != -1 ? text.indexOf('+') : text.indexOf('-'));
            String var = text.replaceAll("[+;\\-;]", "").trim();
            if(op=='+'){
                cobolCodePD.append(INDENT).append("ADD ").append("1 TO ").append(var).append(insideblock?"\n":".\n");
            }
            else if(op=='-'){
                cobolCodePD.append(INDENT).append("SUBTRACT ").append("1 FROM ").append(var).append(insideblock?"\n":".\n");
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
                cobolCodePD.append(INDENT).append("MOVE ").append(rhs).append(" TO ").append(lhs).append(insideblock?"\n":".\n");
                if(op.equals("+")){
                    cobolCodePD.append(INDENT).append("ADD ").append("1 TO ").append(rhs).append(insideblock?"\n":".\n");
                }
                else if(op.equals("-")){
                    cobolCodePD.append(INDENT).append("SUBTRACT ").append("1 FROM ").append(rhs).append(insideblock?"\n":".\n");
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
                    cobolCodePD.append(INDENT).append("ADD ").append("1 TO ").append(rhs).append(insideblock?"\n":".\n");
                }
                else if(op.equals("-")){
                    cobolCodePD.append(INDENT).append("SUBTRACT ").append("1 FROM ").append(rhs).append(insideblock?"\n":".\n");
                }
                cobolCodePD.append(INDENT).append("MOVE ").append(rhs).append(" TO ").append(lhs).append(insideblock?"\n":".\n");
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
                    cobolCodePD.append(INDENT).append(pre).append("\n");
                }

                cobolCodePD.append(INDENT).append("COMPUTE ").append(targetVar).append(" = ").append(rhs).append(insideblock?"\n":".\n");

                for(String post:postOps){
                    cobolCodePD.append(INDENT).append(post).append("\n");
                }
            }
        }
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
        if(text.startsWith("System.out.println") || text.startsWith("System.err.println")){
            String displayedContent=extractDisplayStatement(text);
            if(displayedContent!=null){
                cobolCodePD.append(INDENT).append("DISPLAY ").append(displayedContent).append(insideblock?"\n":".\n");
            }
            return;
        }
        else if(text.startsWith("System.out.print") || text.startsWith("System.err.print")){
            String displayedContent=extractDisplayStatement(text);
            if(displayedContent!=null){
                cobolCodePD.append(INDENT).append("DISPLAY ").append(displayedContent).append(" WITH NO ADVANCING").append(insideblock?"\n":".\n");
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
                    cobolCodePD.append(INDENT)
                            .append("MOVE ").append(rhs).append(" TO ").append(targetVar).append(insideblock?"\n":".\n");
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
                int estimatedParts = 2;
                //-------------Important note is above ☝️ we need to get the map of array sizes from data division and then update estimated parts by that value.
                // Generate INTO part: parts(1), parts(2), ...
                StringBuilder intoClause = new StringBuilder();
                for (int i = 1; i <= estimatedParts; i++) {
                    intoClause.append(varName).append("(").append(i).append(")");
                    if (i < estimatedParts) intoClause.append(", ");
                }

                // Emit COBOL UNSTRING
                cobolCodePD.append(INDENT)
                    .append("UNSTRING ").append(sourceVar)
                    .append(" DELIMITED BY \"").append(delimiter).append("\"")
                    .append(" INTO ").append(intoClause.toString())
                    .append(insideblock ? "\n" : ".\n");
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
                cobolCodePD.append(INDENT).append("STRING ");
                if(append){
                    cobolCodePD.append(targetVar).append(" DELIMITED BY SPACE \n");
                }
                for(int i=0;i<rhsOperands.length-1;i++){
                    // if(rhsOperands[i].equals("\" \"")){
                    //     cobolCodePD.append(INDENT).append(rhsOperands[i]).append("\n");
                    // }
                    // else
                    cobolCodePD.append(INDENT).append(rhsOperands[i]).append(" DELIMITED BY SPACE \n");
                }
                cobolCodePD.append(INDENT).append(rhsOperands[rhsOperands.length-1]).append(" ");
                cobolCodePD.append(" DELIMITED BY SPACE INTO ").append(targetVar).append(insideblock?"\n":".\n");
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

                cobolCodePD.append(INDENT)
                    .append("MOVE ").append(rhs).append(" TO ").append(lhs).append(insideblock ? "\n" : ".\n");
                return;
            }
        }
        
        if(text.startsWith("System.exit")){
            cobolCodePD.append(INDENT).append("STOP RUN").append(insideblock?"\n":".\n");
        }
        else if(text.equals("break;") && !insideSwitch){
            cobolCodePD.append(INDENT).append("EXIT PERFORM").append(insideblock?"\n":".\n");
        }
        else if(text.equals("return;")){
            cobolCodePD.append(INDENT).append("GOBACK").append(insideblock?"\n":".\n");
        }
        else if (text.matches(".*=\\s*\\w+\\.next(Line|Int|Double|Float|Byte|Short|Long|Boolean)?\\s*\\(\\s*\\)\\s*;?")) {
            //scanner class mapped to accept
            String[] parts = text.split("=");
            System.out.println(parts[0] + " and " + parts[1]);

            if (parts.length == 2) {
                String varDecl = parts[0].trim(); // e.g., "int b" or "name"
                String[] tokens = varDecl.split("\\s+"); // Split by whitespace
                String var = tokens[tokens.length - 1]; // Get variable name

                cobolCodePD.append(INDENT).append("ACCEPT ").append(var).append(insideblock?"\n":".\n");
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
                    cobolCodePD.append(INDENT).append("SET ").append(varName).append("-TRUE TO TRUE").append(insideblock?"\n":".\n");
                }
                else if (rhs.equals("false")) {
                    cobolCodePD.append(INDENT).append("SET ").append(varName).append("-FALSE TO FALSE").append(insideblock ? "\n" : ".\n");
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
                    cobolCodePD.append(INDENT).append("ADD ").append(op1).append(" TO ").append(op2).append(" GIVING ").append(targetVar).append(insideblock?"\n":".\n");
                }
                else if(operator=='-'){
                    cobolCodePD.append(INDENT).append("SUBTRACT ").append(op2).append(" FROM ").append(op1).append(" GIVING ").append(targetVar).append(insideblock?"\n":".\n");
                }
                else if(operator=='*'){
                    cobolCodePD.append(INDENT).append("MULTIPLY ").append(op1).append(" BY ").append(op2).append(" GIVING ").append(targetVar).append(insideblock?"\n":".\n");
                }
                else if(operator=='/'){
                    cobolCodePD.append(INDENT).append("DIVIDE ").append(op1).append(" BY ").append(op2).append(" GIVING ").append(targetVar).append(insideblock?"\n":".\n");
                }
                else if(operator=='%'){
                    cobolCodePD.append(INDENT).append("DIVIDE ").append(op1).append(" BY ").append(op2).append(" GIVING ").append(targetVar).append(" REMAINDER ").append(targetVar).append(insideblock?"\n":".\n");
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
                    cobolCodePD.append(INDENT).append("ADD ").append(operand).append(" TO ").append(targetVar).append(insideblock?"\n":".\n");
                }
                else if(operator.equals("-")){
                    cobolCodePD.append(INDENT).append("SUBTRACT ").append(operand).append(" FROM ").append(targetVar).append(insideblock?"\n":".\n");
                }
                else if(operator.equals("*")){
                    cobolCodePD.append(INDENT).append("MULTIPLY ").append(operand).append(" BY ").append(targetVar).append(insideblock?"\n":".\n");
                }
                else if(operator.equals("/")){
                    cobolCodePD.append(INDENT).append("DIVIDE ").append(operand).append(" INTO ").append(targetVar).append(insideblock?"\n":".\n");
                }
                else if(operator.equals("%")){
                    cobolCodePD.append(INDENT).append("DIVIDE ").append(targetVar).append(" BY ").append(operand).append(" GIVING ").append(targetVar).append(" REMAINDER ").append(targetVar).append(insideblock?"\n":".\n");
                }
            }
        }
        else if (text.matches("\\+\\+\\w+\\s*;?") || text.matches("\\-\\-\\w+\\s*;?")) {
            // Handle ++a or --a
            char op=text.charAt(0);
            String var = text.replaceAll("[+;\\-;]", "").trim();
            if(op=='+'){
                cobolCodePD.append(INDENT).append("ADD ").append("1 TO ").append(var).append(insideblock?"\n":".\n");
            }
            else if(op=='-'){
                cobolCodePD.append(INDENT).append("SUBTRACT ").append("1 FROM ").append(var).append(insideblock?"\n":".\n");
            }
        }
        else if (text.matches("\\w+\\+\\+\\s*;?") || text.matches("\\w+\\-\\-\\s*;?")) {
            // Handle a++ or a--
            char op = text.charAt(text.indexOf('+') != -1 ? text.indexOf('+') : text.indexOf('-'));
            String var = text.replaceAll("[+;\\-;]", "").trim();
            if(op=='+'){
                cobolCodePD.append(INDENT).append("ADD ").append("1 TO ").append(var).append(insideblock?"\n":".\n");
            }
            else if(op=='-'){
                cobolCodePD.append(INDENT).append("SUBTRACT ").append("1 FROM ").append(var).append(insideblock?"\n":".\n");
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
                cobolCodePD.append(INDENT).append("MOVE ").append(rhs).append(" TO ").append(lhs).append(insideblock?"\n":".\n");
                if(op.equals("+")){
                    cobolCodePD.append(INDENT).append("ADD ").append("1 TO ").append(rhs).append(insideblock?"\n":".\n");
                }
                else if(op.equals("-")){
                    cobolCodePD.append(INDENT).append("SUBTRACT ").append("1 FROM ").append(rhs).append(insideblock?"\n":".\n");
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
                    cobolCodePD.append(INDENT).append("ADD ").append("1 TO ").append(rhs).append(insideblock?"\n":".\n");
                }
                else if(op.equals("-")){
                    cobolCodePD.append(INDENT).append("SUBTRACT ").append("1 FROM ").append(rhs).append(insideblock?"\n":".\n");
                }
                cobolCodePD.append(INDENT).append("MOVE ").append(rhs).append(" TO ").append(lhs).append(insideblock?"\n":".\n");
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
                    cobolCodePD.append(INDENT).append(pre).append("\n");
                }

                cobolCodePD.append(INDENT).append("COMPUTE ").append(targetVar).append(" = ").append(targetVar).append(" ").append(operator).append(" ").append(rhs).append(insideblock?"\n":".\n");

                for(String post:postOps){
                    cobolCodePD.append(INDENT).append(post).append("\n");
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
                    cobolCodePD.append(INDENT).append(pre).append("\n");
                }

                cobolCodePD.append(INDENT)
                        .append("COMPUTE ")
                        .append(targetVar)
                        .append(" = ")
                        .append(rhs)
                        .append(insideblock ? "\n" : ".\n");

                for (String post : postOps) {
                    cobolCodePD.append(INDENT).append(post).append("\n");
                }
            }
        }

        else if(ctx.SWITCH()!=null){
            String switchVar = ctx.getChild(1).getText().replace("(", "").replace(")", "");
            cobolCodePD.append(INDENT).append("EVALUATE ").append(switchVar).append("\n");
            insideSwitch=true;
            updateInsideBlock();
        }
    }
    public void exitStatement(JavaParser.StatementContext ctx){
        String text=tokens.getText(ctx);
        if (ctx.SWITCH() != null) {
            cobolCodePD.append(INDENT).append("END-EVALUATE.\n");
            insideSwitch=false;
            updateInsideBlock();
        }
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
        if(ctx.CASE()!=null){
            String label = ctx.getChild(1).getText();
            cobolCodePD.append(INDENT).append("WHEN ").append(label).append("\n");
        }
        else if(ctx.DEFAULT()!=null){
            cobolCodePD.append(INDENT).append("WHEN OTHER\n");
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
                    cobolCodePD.append(INDENT_COMMENT).append("* ").append(text).append("\n");
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

}