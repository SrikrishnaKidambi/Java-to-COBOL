import java.io.*;
import java.nio.file.*;

public class JavaToCobolConverter {

    // === CONFIGURABLE PATHS ===
    private static final Path EXTERNAL_JAVA_REPO = Paths.get("ExternalJavaRepo"); // External source of Java files
    private static final Path INTERNAL_PROJECT_ROOT = Paths.get("YourMainProject"); // Your project
    private static final Path TEST_SCOPED_FILE = INTERNAL_PROJECT_ROOT.resolve("Antlr/TestScoped.java");
    private static final Path COBOL_TEMPLATE_FILE = INTERNAL_PROJECT_ROOT.resolve("findCobolCode.cbl");
    private static final Path COBOL_OUTPUT_DIR = INTERNAL_PROJECT_ROOT.resolve("DSA COBOL Dataset");

    // OS-specific separator
    private static final String separator = System.getProperty("os.name").toLowerCase().contains("win") ? ";" : ":";

    public static void main(String[] args) throws IOException {
        Files.walk(EXTERNAL_JAVA_REPO)
            .filter(path -> path.toString().endsWith(".java"))
            .forEach(JavaToCobolConverter::processJavaFileSafely);
    }

    // Wrap full processing in outer try-catch so all files are processed
    private static void processJavaFileSafely(Path javaFilePath) {
        String fileName = javaFilePath.getFileName().toString();
        String baseName = fileName.replace(".java", "");

        try {
            // Step 1: Copy .java into Antlr/TestScoped.java
            String javaContent = Files.readString(javaFilePath);
            Files.writeString(TEST_SCOPED_FILE, javaContent);

            // Step 2: Execute command to run parser and generator
            String command = "cd Antlr && "
                    + "java -cp \"."
                    + separator + "javaparser-core-3.25.8.jar\" TestJavaVariableScoping TestScoped.java"
                    + " && java -cp \"."
                    + separator + "antlr-4.13.2-complete.jar\" ParseTreeGeneration " + baseName;

            runCommand(command, INTERNAL_PROJECT_ROOT.toFile());

            // Step 3: Generate .cbl from template
            String cobolTemplate = Files.readString(COBOL_TEMPLATE_FILE);
            Path cobolFile = COBOL_OUTPUT_DIR.resolve(baseName + ".cbl");
            Files.writeString(cobolFile, cobolTemplate);

            System.out.println("Success in copying " + fileName);

        } catch (Exception e) {
            System.out.println("Unsuccessful Conversion " + fileName);
        }
    }

    private static void runCommand(String command, File workingDir) throws IOException, InterruptedException {
        String shell = System.getProperty("os.name").toLowerCase().contains("win") ? "cmd.exe" : "bash";
        String flag = System.getProperty("os.name").toLowerCase().contains("win") ? "/c" : "-c";

        ProcessBuilder builder = new ProcessBuilder(shell, flag, command);
        builder.directory(workingDir);
        builder.redirectErrorStream(true);

        Process process = builder.start();

        // Read and print output (optional, helps with debugging)
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()))) {
            String line;
            while ((line = reader.readLine()) != null)
                System.out.println(line);
        }

        int exitCode = process.waitFor();
        if (exitCode != 0) {
            throw new RuntimeException("Command failed with exit code " + exitCode);
        }
    }
}
