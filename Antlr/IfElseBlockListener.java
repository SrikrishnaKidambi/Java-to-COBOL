import java.io.*;
import java.util.Stack;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;

public class IfElseBlockListener extends JavaParserBaseListener {
    private final StringBuilder cobolOp = new StringBuilder();
    private int indentLevel = 0;
    private Stack<Integer> ifLevels = new Stack<>();
    
    private String indent() {
        return "    ".repeat(indentLevel);
    }

    @Override
    public void enterStatement(JavaParser.StatementContext ctx) {
        if (ctx.IF() != null) {
            handleIfStatement(ctx);
        }
    }
    
    private void handleIfStatement(JavaParser.StatementContext ctx) {
        String condition = ctx.parExpression().getText();
        cobolOp.append(indent()).append("IF ").append(condition).append("\n");
        
        indentLevel++;
        ifLevels.push(indentLevel);
        
        // Process the if body
        processStatementBody(ctx.statement(0));
        
        // Handle else/else-if chain
        if (ctx.statement().size() > 1) {
            handleElseChain(ctx.statement(1));
        }
        
        // Close the IF statement
        indentLevel = ifLevels.pop() - 1;
        cobolOp.append(indent()).append("END-IF\n");
    }
    
    private void handleElseChain(JavaParser.StatementContext elseStmt) {
        if (elseStmt.IF() != null) {
            // This is an else-if
            indentLevel--;
            String condition = elseStmt.parExpression().getText();
            cobolOp.append(indent()).append("ELSE IF ").append(condition).append("\n");
            indentLevel++;
            
            // Process the else-if body
            processStatementBody(elseStmt.statement(0));
            
            // Handle further else-if or final else
            if (elseStmt.statement().size() > 1) {
                handleElseChain(elseStmt.statement(1));
            }
        } else {
            // This is a final else
            indentLevel--;
            cobolOp.append(indent()).append("ELSE\n");
            indentLevel++;
            
            // Process the else body
            processStatementBody(elseStmt);
        }
    }
    
    private void processStatementBody(JavaParser.StatementContext stmt) {
        if (stmt.block() != null) {
            // Block statement - process all statements in the block
            JavaParser.BlockContext block = stmt.block();
            if (block.blockStatement() != null) {
                for (JavaParser.BlockStatementContext blockStmt : block.blockStatement()) {
                    if (blockStmt.statement() != null) {
                        processStatement(blockStmt.statement());
                    } else if (blockStmt.localVariableDeclaration() != null) {
                        processLocalVariableDeclaration(blockStmt.localVariableDeclaration());
                    }
                }
            }
        } else {
            // Single statement
            processStatement(stmt);
        }
    }
    
    private void processStatement(JavaParser.StatementContext stmt) {
        if (stmt.IF() != null) {
            // Nested IF - recursively handle
            handleIfStatement(stmt);
        } else if (stmt.expression() != null) {
            // Expression statement (like assignments, method calls)
            // processExpression(stmt.expression());
        }
        // Add more statement types as needed
    }
    
    private void processExpression(JavaParser.ExpressionContext ctx) {
        if (ctx != null) {
            String expr = ctx.getText();
            if (expr.startsWith("System.out.println")) {
                String inner = expr.substring(expr.indexOf("(") + 1, expr.lastIndexOf(")"));
                cobolOp.append(indent()).append("DISPLAY ").append(inner).append("\n");
            } else if (expr.contains("=") && !expr.contains("==") && !expr.contains("!=") && !expr.contains("<=") && !expr.contains(">=")) {
                // Simple assignment
                String[] parts = expr.split("=", 2);
                if (parts.length == 2) {
                    cobolOp.append(indent()).append("MOVE ").append(parts[1].trim()).append(" TO ").append(parts[0].trim()).append("\n");
                }
            }
        }
    }
    
    private void processLocalVariableDeclaration(JavaParser.LocalVariableDeclarationContext ctx) {
        String varDecl = ctx.getText();
        cobolOp.append(indent()).append("* ").append(varDecl).append("\n");
    }

    // Override the default behavior to prevent double processing
    @Override
    public void enterLocalVariableDeclaration(JavaParser.LocalVariableDeclarationContext ctx) {
        // Skip - handled by processLocalVariableDeclaration when processing statements
    }

    // @Override
    public void enterExpression(JavaParser.ExpressionContext ctx) {
        // Skip - handled by processExpression when processing statements
    }
    
    @Override
    public void exitStatement(JavaParser.StatementContext ctx) {
        // Skip - IF statements are fully handled in enterStatement
        if (ctx.IF() != null) {
            return; // Prevent default processing
        }
    }

    public void writeCobolCode(String fileName) throws IOException {
        try (PrintWriter writer = new PrintWriter(new FileWriter(fileName))) {
            writer.write(cobolOp.toString());
        }
    }

    public String getCobolCode() {
        return cobolOp.toString();
    }
}