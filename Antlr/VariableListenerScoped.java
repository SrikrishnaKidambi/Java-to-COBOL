import java.io.*;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;

public class VariableListenerScoped extends JavaParserBaseListener{
    private final Map<String, Map<String,List<VariableInfo>>> variables=new LinkedHashMap<>();  // a map that stores the scope of the variables and for each key there will be another map that stores the type as key and names of the variables as values
    private final Deque<String> scopeStack=new ArrayDeque<>();      // initialising a stack that stores the curret scope of the variables.
    private String curr_Type=null;  // a variable that stores the type of the variable that is being visited which can be used for storing the type of the variable as a key for the list of variables at a particular scope
    private String currentMethod=null;

    public VariableListenerScoped(){
        scopeStack.push("GLOBAL");
    }

    // method that returns the current scope as a path.
    private String currentScope(){
        return String.join("->", scopeStack);
    }

    // for CLASSES

    @Override
    public void enterClassDeclaration(JavaParser.ClassDeclarationContext ctx){
        String className = ctx.identifier().getText();
        scopeStack.push("Class:"+className);
    }

    @Override
    public void exitClassDeclaration(JavaParser.ClassDeclarationContext ctx){
        scopeStack.pop();       // pop the scope that is stored at the top of the stack as we are exiting the class
    }

    // for METHODS

    @Override
    public void enterMethodDeclaration(JavaParser.MethodDeclarationContext ctx){
        String methodName = ctx.identifier().getText();
        scopeStack.push("Method:"+methodName);
        currentMethod=methodName;

        JavaParser.FormalParametersContext parameters = ctx.formalParameters();
        if(parameters != null && parameters.formalParameterList() != null){
            for(JavaParser.FormalParameterContext parameterCtx : parameters.formalParameterList().formalParameter()){
                String parameterType = parameterCtx.typeType().getText();
                String parameterName = parameterCtx.variableDeclaratorId().getText();
                addVariable(parameterType, parameterName, null);
            }
        }
    }

    @Override
    public void exitMethodDeclaration(JavaParser.MethodDeclarationContext ctx){
        scopeStack.pop();
        currentMethod=null;
    }

    // Loop Blocks

    @Override
    public void enterBlock(JavaParser.BlockContext ctx){
        scopeStack.push("Block");
    }

    @Override
    public void exitBlock(JavaParser.BlockContext ctx){
        scopeStack.pop();
    }

    @Override
    public void enterStatement(JavaParser.StatementContext ctx){
        // Handle different statement types
        if(ctx.getChildCount() > 0 && ctx.getChild(0).getText().equals("for")){
            scopeStack.push("For");
        } else if(ctx.getChildCount() > 0 && ctx.getChild(0).getText().equals("while")){
            scopeStack.push("While");
        } else if(ctx.getText().startsWith("if")){
            scopeStack.push("If");
        }
    }

    @Override
    public void exitStatement(JavaParser.StatementContext ctx){
        // Handle different statement types
        if(ctx.getChildCount() > 0 && ctx.getChild(0).getText().equals("for")){
            scopeStack.pop();
        } else if(ctx.getChildCount() > 0 && ctx.getChild(0).getText().equals("while")){
            scopeStack.pop();
        } else if(ctx.getText().startsWith("if")){
            scopeStack.pop();
        }
    }

    @Override
    public void enterEnhancedForControl(JavaParser.EnhancedForControlContext ctx){
        scopeStack.push("EnhancedFor");
        String type = ctx.typeType().getText();
        String variableName = ctx.variableDeclaratorId().getText();
        addVariable(type, variableName, null);
    }

    @Override
    public void exitEnhancedForControl(JavaParser.EnhancedForControlContext ctx){
        scopeStack.pop();
    } 

    // Try-catch blocks - handle through statement context
    @Override
    public void enterCatchClause(JavaParser.CatchClauseContext ctx){
        scopeStack.push("Catch");
        if(ctx.catchType() != null){
            String type = ctx.catchType().getText();
            String variableName = ctx.identifier().getText();
            addVariable(type, variableName, null);
        }
    }

    @Override
    public void exitCatchClause(JavaParser.CatchClauseContext ctx){
        scopeStack.pop();
    }

    @Override
    public void enterFinallyBlock(JavaParser.FinallyBlockContext ctx){
        scopeStack.push("Finally");
    }

    @Override
    public void exitFinallyBlock(JavaParser.FinallyBlockContext ctx){
        scopeStack.pop();
    }

    @Override
    public void enterLocalVariableDeclaration(JavaParser.LocalVariableDeclarationContext ctx){
        if(ctx.typeType() != null){
            curr_Type = ctx.typeType().getText();
        }
    }

    @Override
    public void exitLocalVariableDeclaration(JavaParser.LocalVariableDeclarationContext ctx){
        curr_Type = null;
    }

    @Override
    public void enterVariableDeclarators(JavaParser.VariableDeclaratorsContext ctx){
        for(JavaParser.VariableDeclaratorContext variableCtx : ctx.variableDeclarator()){
            String variableName = variableCtx.variableDeclaratorId().getText();
            String size = null;

            // Extract array dimensions from variable declarator id (e.g., arr[])
            if(variableCtx.variableDeclaratorId().getText().contains("[")){
                String varId = variableCtx.variableDeclaratorId().getText();
                int bracketCount = 0;
                for(char c : varId.toCharArray()){
                    if(c == '[') bracketCount++;
                }
                if(bracketCount > 0){
                    size = "[]".repeat(bracketCount);
                }
            }

            // Extract array size from initializer (e.g., new int[9])
            if(variableCtx.variableInitializer() != null){
                String exprTxt = variableCtx.variableInitializer().getText();
                if(exprTxt.startsWith("new")){
                    // Pattern to match new Type[size] or new Type[size1][size2]...
                    Pattern pattern = Pattern.compile("new\\s*\\w+(?:<[^>]*>)?\\s*((\\[[^\\]]*\\])+)");
                    Matcher matcher = pattern.matcher(exprTxt);
                    if(matcher.find()){
                        String dimensions = matcher.group(1);
                        // Extract the content inside brackets
                        Pattern bracketPattern = Pattern.compile("\\[([^\\]]*)\\]");
                        Matcher bracketMatcher = bracketPattern.matcher(dimensions);
                        StringBuilder sizeBuilder = new StringBuilder();
                        while(bracketMatcher.find()){
                            String content = bracketMatcher.group(1).trim();
                            if(sizeBuilder.length() > 0) sizeBuilder.append(",");
                            sizeBuilder.append(content.isEmpty() ? "?" : content);
                        }
                        if(sizeBuilder.length() > 0){
                            size = "[" + sizeBuilder.toString() + "]";
                        }
                    }
                }
            }
            addVariable(curr_Type, variableName, size);
        }
    }

    @Override
    public void enterFieldDeclaration(JavaParser.FieldDeclarationContext ctx){
        if(ctx.typeType() != null){
            curr_Type = ctx.typeType().getText();
        }
    }

    @Override
    public void exitFieldDeclaration(JavaParser.FieldDeclarationContext ctx){
        curr_Type = null;
    }

    // Utility methods

    private void addVariable(String type, String name, String size){
        String scope = currentScope();
        String arraySize = size;
        
        // Extract array dimensions from type if not already determined
        if(arraySize == null && type != null){
            Matcher m = Pattern.compile("(\\[\\])+").matcher(type);
            if(m.find()){
                String brackets = m.group(1);
                int dims = brackets.length() / 2;
                arraySize = "[]".repeat(dims);
            }
        }
        
        // Clean the type by removing array brackets since we store size separately
        String cleanType = type;
        if(type != null){
            cleanType = type.replaceAll("\\[\\]", "");
        }
        
        String annotatedName=name;
        // if(currentMethod!=null && !"main".equals(currentMethod)){
        //     annotatedName=name+"_"+currentMethod;
        // }

        // Create final variable for lambda
        final String finalArraySize = arraySize;
        
        // Create VariableInfo object
        VariableInfo varInfo = new VariableInfo(annotatedName, finalArraySize);
        
        // Check for duplicates before adding
        Map<String, List<VariableInfo>> scopeMap = variables.computeIfAbsent(scope, k -> new LinkedHashMap<>());
        List<VariableInfo> varList = scopeMap.computeIfAbsent(cleanType, k -> new ArrayList<>());
        
        // Only add if this variable doesn't already exist in this scope and type
        boolean exists = varList.stream().anyMatch(existing -> 
            existing.name.equals(name) && 
            Objects.equals(existing.size, finalArraySize)
        );
        
        if(!exists){
            varList.add(varInfo);
        }
    }

    public Map<String,Map<String,List<VariableInfo>>>getVariableData(){
        return variables;
    }

    public void writeToFile(String fileName) throws IOException{
        try(PrintWriter writer=new PrintWriter(new FileWriter(fileName))){
            for(Map.Entry<String,Map<String,List<VariableInfo>>>scopeEntry:variables.entrySet()){
                writer.println("Scope:"+scopeEntry.getKey());
                for(Map.Entry<String,List<VariableInfo>> typeEntry:scopeEntry.getValue().entrySet()){
                    writer.println("  Type:"+typeEntry.getKey());
                    for(VariableInfo varInfo:typeEntry.getValue()){
                        writer.println("    "+varInfo);
                    }
                }
                writer.println();
            }
        }
    }
}