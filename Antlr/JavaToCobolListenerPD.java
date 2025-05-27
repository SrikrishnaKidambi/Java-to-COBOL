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
    public JavaToCobolListenerPD(TokenStream tokens){
        this.tokens = tokens;
        cobolCodePD.append(INDENT).append("PROCEDURE DIVISION.\n\n");
    }
    public String getCobolCodePD(){
        return cobolCodePD.toString();
    }
    //-----------Declaration types---------------
    @Override
    public void enterLocalVariableDeclaration(JavaParser.LocalVariableDeclarationContext ctx){
        addLeadingComments(ctx);
        String text=tokens.getText(ctx);
        System.out.println(text);
        if(text.contains("Scanner") && text.contains("System.in")){
            cobolCodePD.append(INDENT_COMMENT).append("* Input from ODT is enabled\n");
        }
        else if (text.matches(".*=\\s*\\w+\\.next(Line|Int|Double|Float|Byte|Short|Long|Boolean)?\\s*\\(\\s*\\)\\s*;?")) {
            String[] parts = text.split("=");
            System.out.println(parts[0] + " and " + parts[1]);

            if (parts.length == 2) {
                String varDecl = parts[0].trim(); // e.g., "int b" or "name"
                String[] tokens = varDecl.split("\\s+"); // Split by whitespace
                String var = tokens[tokens.length - 1]; // Get variable name

                cobolCodePD.append(INDENT).append("ACCEPT ").append(var).append(insideblock?"\n":".\n");
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
        else if (text.matches(".*=\\s*.+\\s*;?")) {
            // move statement mapping
            String[] parts = text.split("=");

            if (parts.length == 2) {
                String lhs = parts[0].trim();
                String[] lhsTokens = lhs.split("\\s+");
                String targetVar = lhsTokens[lhsTokens.length - 1]; // get variable name

                String rhs = parts[1].replace(";", "").trim();

                // Match string/char literals or simple variables/literals
                if (rhs.matches("\"[^\"]*\"|'[^']*'|[\\w\\d_]+")) {
                    cobolCodePD.append(INDENT)
                            .append("MOVE ").append(rhs).append(" TO ").append(targetVar).append(insideblock?"\n":".\n");
                }
            }
        }
        else if(text.matches("(int|float|double|long|short|var)?\\s*\\w+\\s*=\\s*[^;]*[+\\-*/%][^;]*;?")){
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
        
        if(text.startsWith("System.out.println")){
            String displayedContent=extractDisplayStatement(text);
            if(displayedContent!=null){
                cobolCodePD.append(INDENT).append("DISPLAY ").append(displayedContent).append(insideblock?"\n":".\n");
            }
        }
        else if(text.startsWith("System.out.print")){
            String displayedContent=extractDisplayStatement(text);
            if(displayedContent!=null){
                cobolCodePD.append(INDENT).append("DISPLAY ").append(displayedContent).append(" WITH NO ADVANCING").append(insideblock?"\n":".\n");
            }
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
        else if (text.matches(".*=\\s*.+\\s*;?")) {
            // move statement mapping
            String[] parts = text.split("=");

            if (parts.length == 2) {
                String lhs = parts[0].trim();
                String[] lhsTokens = lhs.split("\\s+");
                String targetVar = lhsTokens[lhsTokens.length - 1]; // get variable name

                String rhs = parts[1].replace(";", "").trim();

                // Match string/char literals or simple variables/literals
                if (rhs.matches("\"[^\"]*\"|'[^']*'|[\\w\\d_]+")) {
                    cobolCodePD.append(INDENT)
                            .append("MOVE ").append(rhs).append(" TO ").append(targetVar).append(insideblock?"\n":".\n");
                }
            }
        }
        else if(text.matches("\\s*(\\w+)\\s*([+\\-*/%]=)\\s*[^;]+;?")){
            System.out.println("Entered the dragon "+text);
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
                    cobolCodePD.append(INDENT).append(pre).append("\n");
                }

                cobolCodePD.append(INDENT).append("COMPUTE ").append(targetVar).append(" = ").append(targetVar).append(" ").append(operator).append(" ").append(rhs).append(insideblock?"\n":".\n");

                for(String post:postOps){
                    cobolCodePD.append(INDENT).append(post).append("\n");
                }
            }
        }
        else if(text.matches("(int|float|double|long|short|var)?\\s*\\w+\\s*=\\s*[^;]*[+\\-*/%][^;]*;?")){
            //for compute
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
                    cobolCodePD.append(INDENT).append(pre).append("\n");
                }

                cobolCodePD.append(INDENT).append("COMPUTE ").append(targetVar).append(" = ").append(rhs).append(insideblock?"\n":".\n");

                for(String post:postOps){
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
    private String extractDisplayStatement(String text){
        int start=text.indexOf('(');
        int end=text.indexOf(')');
        if(start>=0 && end>start){
            String res="";
            for(int i=start+1;i<end;i++){
                char ch = text.charAt(i);
                if(ch !='+'){
                    res+=ch;
                }
                else{
                    res+=" ";
                }
            }
            return res;
        }
        return null;
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
}