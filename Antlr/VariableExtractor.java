import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.*;

public class VariableExtractor {
    public static void variableExtractor(String className) throws Exception{
        CharStream codeStream = CharStreams.fromFileName("TestScoped.java");
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
        DataDivisionGen.generateDataDivision("variables.txt", "cobol_test1.cbl",className);
    }
    public String getIdentificationDataDivisions(){
        String filePath = "cobol_test1.cbl";  // Ensure this path is correct
        try {
            return Files.readString(Paths.get(filePath));
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }
}