import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;
import org.antlr.v4.gui.TreeViewer;
import org.antlr.v4.runtime.tree.ParseTreeWalker;

import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.Arrays;
import java.util.List;

import javax.swing.JFrame;
import javax.swing.JScrollPane;

public class ParseTreeGeneration {
    private static String idDdDivisions;
    private static String pdDivision;
    public static void main(String[] args) throws Exception {
        String code = Files.readString(Paths.get("Test.java"));  // input Java code
        String className = args[0];
        CharStream input = CharStreams.fromString(code);
        JavaLexer lexer = new JavaLexer(input);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        JavaParser parser = new JavaParser(tokens);

        ParseTree tree = parser.compilationUnit(); // entry rule for Java

        System.out.println(tree.toStringTree(parser));  // print the parse tree
        
        //cobol code generation
        ParseTreeWalker walker = new ParseTreeWalker();
        JavaToCobolListenerPD pdListener = new JavaToCobolListenerPD(tokens);
        walker.walk(pdListener, tree);
        // System.out.println("Generated COBOL:\n" + pdListener.getCobolCodePD());
        pdDivision = pdListener.getCobolCodePD();
        VariableExtractor idDdListener = new VariableExtractor();
        VariableExtractor.variableExtractor(className);
        idDdDivisions = idDdListener.getIdentificationDataDivisions();
        Path outputPath = Paths.get("../finalCobolCode.cbl");
        // System.out.println("----------------Data division starts-----------------");
        // System.out.println(idDdDivisions);
        List<String> linesToWrite = List.of(idDdDivisions, "", pdDivision); // "" adds a new line
        //Just for testing use below
        // List<String> linesToWrite = List.of(pdDivision);
        Files.write(outputPath, linesToWrite, StandardCharsets.UTF_8,
                    StandardOpenOption.CREATE, StandardOpenOption.TRUNCATE_EXISTING);

        System.out.println("COBOL code successfully written to ../finalCobolCode.cbl");

        TreeViewer viewer = new TreeViewer(Arrays.asList(parser.getRuleNames()), tree);
        viewer.setScale(0.75); // Optional: zoom in a bit

        // Wrap viewer in JScrollPane for both scroll directions
        JScrollPane scrollPane = new JScrollPane(viewer);
        scrollPane.setHorizontalScrollBarPolicy(JScrollPane.HORIZONTAL_SCROLLBAR_AS_NEEDED);
        scrollPane.setVerticalScrollBarPolicy(JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED);

        // Show in JFrame
        JFrame frame = new JFrame("Parse Tree Viewer");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.getContentPane().add(scrollPane); // Add scrollPane, not frame
        frame.setSize(800, 600);
        frame.setVisible(true);
    }
}