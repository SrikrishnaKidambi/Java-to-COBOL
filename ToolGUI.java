import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.io.*;

public class ToolGUI {
    private static final String DEFAULT_CODE = "public class Test {\n    // code comes here\n}";
    public static void main(String[] args) {
        // Create the main frame
        JFrame frame = new JFrame("RISHA LAB - Java to COBOL");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(1000, 700);

        // Set logo/icon
        ImageIcon icon = new ImageIcon("risha_logo.png"); // Make sure logo.png is in project root or adjust path
        frame.setIconImage(icon.getImage());

        // Set fonts and colors
        Font codeFont = new Font("Monospaced", Font.PLAIN, 16);
        Color bgColor = new Color(30, 30, 30);   // dark background
        Color textColor = new Color(0, 255, 0);  // green text

        // Heading
        JLabel heading = new JLabel("Java to COBOL", SwingConstants.CENTER);
        heading.setFont(new Font("Serif", Font.BOLD, 24));
        heading.setForeground(textColor);
        heading.setBackground(bgColor);
        heading.setOpaque(true);
        frame.add(heading, BorderLayout.NORTH);

        // Code areas
        JTextArea javaCodeArea = new JTextArea(DEFAULT_CODE, 20, 40);
        JTextArea cobolCodeArea = new JTextArea(20, 40);
        JTextArea consoleArea = new JTextArea(5, 90);

        // Apply font and colors
        JTextArea[] textAreas = {javaCodeArea, cobolCodeArea, consoleArea};
        for (JTextArea area : textAreas) {
            area.setFont(codeFont);
            area.setBackground(bgColor);
            area.setForeground(textColor);
            area.setCaretColor(textColor);
        }

        cobolCodeArea.setEditable(false);
        consoleArea.setEditable(false);

        // Scroll panes
        JScrollPane javaScroll = new JScrollPane(javaCodeArea);
        JScrollPane cobolScroll = new JScrollPane(cobolCodeArea);
        JScrollPane consoleScroll = new JScrollPane(consoleArea);

        // Java section buttons
        JPanel buttonPanel = new JPanel();
        buttonPanel.setBackground(bgColor);
        JButton runButton = new JButton("Run");
        JButton clearButton = new JButton("Clear");

        // Style buttons
        JButton[] buttons = {runButton, clearButton};
        for (JButton button : buttons) {
            button.setForeground(textColor);
            button.setBackground(new Color(50, 50, 50));
            button.setFocusPainted(false);
        }

        buttonPanel.add(runButton);
        buttonPanel.add(clearButton);

        // Left Panel (Java code + buttons)
        JPanel leftPanel = new JPanel(new BorderLayout());
        leftPanel.add(buttonPanel, BorderLayout.NORTH);
        leftPanel.add(javaScroll, BorderLayout.CENTER);

        // SplitPane: Java code (left) | COBOL code (right)
        JSplitPane customSplit = new JSplitPane(JSplitPane.HORIZONTAL_SPLIT, leftPanel, cobolScroll);
        customSplit.setResizeWeight(0.5);
        frame.add(customSplit, BorderLayout.CENTER);
        frame.add(consoleScroll, BorderLayout.SOUTH);

        // Clear button logic
        clearButton.addActionListener(e -> javaCodeArea.setText(DEFAULT_CODE));

        // Run button logic
        runButton.addActionListener(e -> {
            try {
                String javaCode = javaCodeArea.getText();
                File file = new File("C:\\Users\\srikr\\OneDrive\\Documents\\GitHub\\Java-to-COBOL\\Antlr\\Test.java");
                FileWriter writer = new FileWriter(file);
                writer.write(javaCode);
                writer.close();

                ProcessBuilder builder = new ProcessBuilder(
                        "cmd.exe", "/c", "cd C:\\Users\\srikr\\OneDrive\\Documents\\GitHub\\Java-to-COBOL\\Antlr && java -cp \".;antlr-4.13.2-complete.jar\" ParseTreeGeneration"
                );
                builder.redirectErrorStream(true);
                Process process = builder.start();

                BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
                String line;
                consoleArea.setText(""); // Clear previous output
                while ((line = reader.readLine()) != null) {
                    consoleArea.append(line + "\n");
                }
            } catch (Exception ex) {
                ex.printStackTrace();
                consoleArea.append("Error: " + ex.getMessage() + "\n");
            }
        });

        frame.setVisible(true);
    }
}