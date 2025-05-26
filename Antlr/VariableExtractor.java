import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;
import java.io.*;
import java.util.*;

public class VariableExtractor {
    public static void main(String[] args) throws Exception{
        CharStream codeStream = CharStreams.fromFileName("Test_method.java");
        String codeTxt = codeStream.toString();
        
        JavaLexer lexer = new JavaLexer(codeStream);    // initialising lexer
        CommonTokenStream tokens = new CommonTokenStream(lexer);

        JavaParser parser = new JavaParser(tokens);

        ParseTree tree = parser.compilationUnit();    // generating parse tree
        ParseTreeWalker walker = new ParseTreeWalker();
        VariableListenerScoped extractor = new VariableListenerScoped();
        walker.walk(extractor, tree);

        extractor.writeToFile("variables.txt");
        // MethodAppender appender = new MethodAppender(tokens, codeTxt);
        // walker.walk(appender, tree);

        // appender.applyInsertions("Test1_modified.java");
        // MethodInjector.injectMethods("Test1.java", extractor.getVariableData());
        // System.out.println("Modified file written to Test1_modified.java");
        DataDivisionGen.generateDataDivision("variables.txt", "cobol_test1.cbl");
    }
}