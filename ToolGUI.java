import javax.swing.*;
import javax.swing.filechooser.FileNameExtensionFilter;

import java.awt.*;
import java.awt.datatransfer.Clipboard;
import java.awt.datatransfer.StringSelection;
import java.awt.event.*;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
        // JTextArea consoleArea = new JTextArea(5, 90);

        // Apply font and colors
        JTextArea[] textAreas = {javaCodeArea, cobolCodeArea};
        for (JTextArea area : textAreas) {
            area.setFont(codeFont);
            area.setBackground(bgColor);
            area.setForeground(textColor);
            area.setCaretColor(textColor);
        }
        cobolCodeArea.setForeground(Color.CYAN); // or Color.BLUE
        cobolCodeArea.setCaretColor(Color.CYAN);
        cobolCodeArea.setEditable(false);
        // consoleArea.setEditable(false);


        //cobol button panel
        JPanel cobolPanel = new JPanel(new BorderLayout());
        cobolPanel.setBackground(bgColor);

        JPanel cobolButtonPanel = new JPanel();
        cobolButtonPanel.setBackground(bgColor);
        JButton copyButton = new JButton("Copy");
        JButton saveButton = new JButton("Save");
        JButton[] buttons = {copyButton,saveButton};
        for(JButton button: buttons){
            button.setForeground(Color.CYAN);
            button.setBackground(new Color(50,50,50));
            button.setFocusPainted(false);
        }

        cobolButtonPanel.add(copyButton);
        cobolButtonPanel.add(saveButton);

        //logic for copy button and save button
        copyButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                String cobolCode = cobolCodeArea.getText();
                StringSelection selection = new StringSelection(cobolCode);
                Clipboard clipboard = Toolkit.getDefaultToolkit().getSystemClipboard();
                clipboard.setContents(selection, null);
                JOptionPane.showMessageDialog(frame, "COBOL code copied to clipboard.");
            }
        });

        saveButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                JFileChooser fileChooser = new JFileChooser();
                fileChooser.setSelectedFile(new File("code.cbl"));
                int option = fileChooser.showSaveDialog(frame);
                if (option == JFileChooser.APPROVE_OPTION) {
                    File file = fileChooser.getSelectedFile();
                    try (FileWriter writer = new FileWriter(file)) {
                        writer.write(cobolCodeArea.getText());
                        JOptionPane.showMessageDialog(frame, "File saved successfully!");
                    } catch (IOException ex) {
                        JOptionPane.showMessageDialog(frame, "Error saving file: " + ex.getMessage());
                    }
                }
            }
        });


        // Scroll panes
        JScrollPane javaScroll = new JScrollPane(javaCodeArea);
        JScrollPane cobolScroll = new JScrollPane(cobolCodeArea);

        cobolPanel.add(cobolScroll,BorderLayout.CENTER);
        cobolPanel.add(cobolButtonPanel,BorderLayout.NORTH);
        // JScrollPane consoleScroll = new JScrollPane(consoleArea);

        // Java section buttons
        JPanel buttonPanel = new JPanel();
        buttonPanel.setBackground(bgColor);
        JButton runButton = new JButton("Run");
        JButton clearButton = new JButton("Clear");

        // Style buttons
        JButton[] buttons1 = {runButton, clearButton};
        for (JButton button : buttons1) {
            button.setForeground(textColor);
            button.setBackground(new Color(50, 50, 50));
            button.setFocusPainted(false);
        }

        // Left Panel (Java code + buttons)
        JPanel leftPanel = new JPanel(new BorderLayout());
        leftPanel.add(buttonPanel, BorderLayout.NORTH);
        leftPanel.add(javaScroll, BorderLayout.CENTER);

        // SplitPane: Java code (left) | COBOL code (right)
        JSplitPane customSplit = new JSplitPane(JSplitPane.HORIZONTAL_SPLIT, leftPanel, cobolPanel);
        customSplit.setResizeWeight(0.5);
        frame.add(customSplit, BorderLayout.CENTER);
        // frame.add(consoleScroll, BorderLayout.SOUTH);

        String[] classname = new String[1];
        JButton uploadButton = new JButton("Upload");
        uploadButton.setForeground(textColor);
        uploadButton.setBackground(new Color(50, 50, 50));
        uploadButton.setFocusPainted(false);


        buttonPanel.add(uploadButton);
        buttonPanel.add(runButton);
        buttonPanel.add(clearButton);

        //upload button logic
        uploadButton.addActionListener(e -> {
            JFileChooser fileChooser = new JFileChooser();
            FileNameExtensionFilter filter = new FileNameExtensionFilter("Java Files", "java");
            fileChooser.setFileFilter(filter);

            int option = fileChooser.showOpenDialog(frame);
            if (option == JFileChooser.APPROVE_OPTION) {
                File file = fileChooser.getSelectedFile();
                try {
                    String content = Files.readString(file.toPath());

                    // Extract class name
                    Pattern pattern = Pattern.compile("public\\s+class\\s+(\\w+)");
                    Matcher matcher = pattern.matcher(content);
                    if (matcher.find()) {
                        classname[0] = matcher.group(1);
                        // Replace original class name with "Test"
                        content = content.replaceFirst("public\\s+class\\s+" + classname[0], "public class Test");
                    } else {
                        classname[0] = "Unknown";
                    }

                    javaCodeArea.setText(content);

                    JOptionPane.showMessageDialog(frame, "Java file loaded. Original class: " + classname[0] + " → Replaced with: Test");

                } catch (IOException ex) {
                    JOptionPane.showMessageDialog(frame, "Error reading file: " + ex.getMessage());
                }
            }
        });

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
                String command = "cd C:\\Users\\srikr\\OneDrive\\Documents\\GitHub\\Java-to-COBOL\\Antlr && "
                       + "java -cp \".;antlr-4.13.2-complete.jar\" ParseTreeGeneration " + classname[0];
                ProcessBuilder builder = new ProcessBuilder(
                        "cmd.exe", "/c", command
                );
                builder.redirectErrorStream(true);
                Process process = builder.start();

                BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
                String line;
                //consoleArea.setText(""); // Clear previous output
                while ((line = reader.readLine()) != null) {
                   // consoleArea.append(line + "\n");
                }

                //getting the cobol code
                String cobolCode = Files.readString(Paths.get("C:\\Users\\srikr\\OneDrive\\Documents\\GitHub\\Java-to-COBOL\\finalCobolCode.cbl"));
                cobolCodeArea.setText(cobolCode);
                
            } catch (Exception ex) {
                ex.printStackTrace();
                //consoleArea.append("Error: " + ex.getMessage() + "\n");
            }
        });


        frame.setVisible(true);
    }
}