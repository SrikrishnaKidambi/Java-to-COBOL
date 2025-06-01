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
        JLabel heading = new JLabel("Java to COBOL", SwingConstants.CENTER) {
            @Override
            protected void paintComponent(Graphics g) {
                super.paintComponent(g);

                Graphics2D g2d = (Graphics2D) g.create();
                Font font = getFont();
                String text = getText();

                g2d.setRenderingHint(RenderingHints.KEY_TEXT_ANTIALIASING,
                                    RenderingHints.VALUE_TEXT_ANTIALIAS_ON);

                FontMetrics fm = g2d.getFontMetrics(font);
                int textWidth = fm.stringWidth(text);
                int textHeight = fm.getAscent();

                int x = (getWidth() - textWidth) / 2;
                int y = (getHeight() + textHeight) / 2 - fm.getDescent();

                // Use LinearGradientPaint for three-color gradient
                float[] fractions = {0.0f, 0.5f, 1.0f};
                Color[] colors = {
                    new Color(255, 153, 51),   // Orange
                    Color.WHITE,
                    new Color(19, 136, 8)      // Green
                };

                LinearGradientPaint gradient = new LinearGradientPaint(
                    x, 0, x + textWidth, 0, fractions, colors
                );

                g2d.setFont(font);
                g2d.setPaint(gradient);
                g2d.drawString(text, x, y);

                g2d.dispose();
            }
        };

        heading.setFont(new Font("Serif", Font.BOLD, 24));
        heading.setOpaque(true);
        heading.setBackground(Color.BLACK);
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
        classname[0]="Unknown";
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
                        // content = content.replaceFirst("public\\s+class\\s+" + classname[0], "public class Test");
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

                Pattern pattern = Pattern.compile("public\\s+class\\s+(\\w+)");
                Matcher matcher = pattern.matcher(javaCode);

                if (matcher.find()) {
                    if(classname[0].equals("Unknown") || !classname[0].equals(matcher.group(1))){
                        classname[0] = matcher.group(1); // Save the original class name
                    }
                    javaCode = javaCode.replaceFirst("public\\s+class\\s+" + classname[0], "public class Test");
                } else {
                    JOptionPane.showMessageDialog(frame, "No valid public class found.");
                    return;
                }

                // Write the modified code to Test.java
                File file = new File("Antlr/Test.java");
                FileWriter writer = new FileWriter(file);
                writer.write(javaCode);
                writer.close();

                // Ask for OS type
                Object[] options = {"Windows", "Linux/Mac"};
                int choice = JOptionPane.showOptionDialog(frame,
                        "Select your Operating System",
                        "Choose OS",
                        JOptionPane.DEFAULT_OPTION,
                        JOptionPane.QUESTION_MESSAGE,
                        null,
                        options,
                        options[0]);

                if (choice == -1) {
                    JOptionPane.showMessageDialog(frame, "You must select an OS.");
                    return;
                }

                String separator = (choice == 0) ? ";" : ":";
                String shell = (choice == 0) ? "cmd.exe" : "bash";
                String shellFlag = (choice == 0) ? "/c" : "-c";
                String command = "cd Antlr && java -cp \"."
                        + separator + "antlr-4.13.2-complete.jar\" ParseTreeGeneration " + classname[0];

                ProcessBuilder builder = new ProcessBuilder(shell, shellFlag, command);
                builder.redirectErrorStream(true);
                Process process = builder.start();

                BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
                String line;
                // consoleArea.setText(""); // Optional: clear previous output
                while ((line = reader.readLine()) != null) {
                    // consoleArea.append(line + "\n");
                }

                // Read the COBOL output
                String cobolPath = "finalCobolCode.cbl"; 
                String cobolCode = Files.readString(Paths.get(cobolPath));
                cobolCodeArea.setText(cobolCode);

            } catch (Exception ex) {
                ex.printStackTrace();
                // consoleArea.append("Error: " + ex.getMessage() + "\n");
            }
        });



        frame.setVisible(true);
    }
}