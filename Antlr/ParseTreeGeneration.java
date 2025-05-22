import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;
import org.antlr.v4.gui.TreeViewer;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Arrays;

import javax.swing.JFrame;
import javax.swing.JScrollPane;

public class ParseTreeGeneration {
    public static void main(String[] args) throws Exception {
        String code = Files.readString(Paths.get("Test.java"));  // input Java code

        CharStream input = CharStreams.fromString(code);
        JavaLexer lexer = new JavaLexer(input);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        JavaParser parser = new JavaParser(tokens);

        ParseTree tree = parser.compilationUnit(); // entry rule for Java

        System.out.println(tree.toStringTree(parser));  // print the parse tree

        TreeViewer viewer = new TreeViewer(Arrays.asList(parser.getRuleNames()), tree);
        viewer.setScale(1.5); // Optional: zoom in a bit

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