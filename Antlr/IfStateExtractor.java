import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;
import java.io.*;
import java.util.*;

public class IfStateExtractor {
    public static void main(String[] args)throws Exception{
        CharStream codeStream=CharStreams.fromFileName("Testif.java");
        JavaLexer lexer=new JavaLexer(codeStream);

        CommonTokenStream tokens=new CommonTokenStream(lexer);
        JavaParser parser=new JavaParser(tokens);
        ParseTree tree=parser.compilationUnit();

        ParseTreeWalker walker=new ParseTreeWalker();
        IfElseBlockListener listener=new IfElseBlockListener();
        walker.walk(listener,tree);

        listener.writeCobolCode("if_statement.cbl");
    }
}
