import java.io.*;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class DataDivisionGen {

    private static String mapJavaTypeToCobolPic(String javaType) {
        javaType = javaType.toLowerCase();
        if (javaType.contains("int") || javaType.contains("long")) {
            return "PIC S9(5).";
        } else if (javaType.contains("float") || javaType.contains("double")) {
            return "PIC S9(5)V9(2).";
        } else if (javaType.contains("char")) {
            return "PIC X(1).";
        } else if (javaType.contains("boolean")) {
            return "PIC X(1).";
        } else {
            return "PIC X(100).";
        }
    }

    public static void generateDataDivision(String inputFile,String outputFile,String className)throws IOException{
        try(BufferedReader reader=new BufferedReader(new FileReader(inputFile));
        PrintWriter writer=new PrintWriter(new FileWriter(outputFile))){
            String[] cblPgmID=outputFile.split("\\.");    // extracting the name of the cobol file

            writer.println("       IDENTIFICATION DIVISION.");
            writer.println("       PROGRAM-ID. "+className+".");
            writer.println();
            writer.println();
            writer.println("       DATA DIVISION.");
            writer.println("       WORKING-STORAGE SECTION.");

            String line;
            String currScope = "";
            String currType = "";

            Map<String, List<String[]>> methodVariables = new HashMap<>();
            String currMethodName = "";

            while ((line = reader.readLine()) != null) {
                line = line.trim();

                if (line.startsWith("Scope:")) {
                    currScope = line.substring(6).trim().replace("->", "_").replace(":", "_").toUpperCase();
                    writer.println("      * Variables for Scope:" + currScope);

                    if (currScope.contains("METHOD")) {
                        String[] parts = line.split("->");
                        for (String part : parts) {
                            if (part.trim().toLowerCase().startsWith("method:")) {
                                currMethodName = part.split(":")[1].trim();
                                if (!methodVariables.containsKey(currMethodName)) {
                                    methodVariables.put(currMethodName, new ArrayList<>());
                                }
                            }
                        }
                    } else {
                        currMethodName = "";  // Reset if not in a method scope
                    }

                } else if (line.startsWith("Type:")) {
                    currType = line.substring(5).trim();
                } else if (!line.isEmpty()) {
                    String variableName = line;
                    String cobolVarname = "";
                    String arraySize = "";

                    int sizeIdx = variableName.indexOf("[size=");
                    if (sizeIdx != -1) {
                        // Extract clean variable name (everything before "[size=")
                        cobolVarname = variableName.substring(0, sizeIdx).trim();

                        // Extract the content inside [size= ... ]
                        // Format from VariableInfo.toString(): "name [size=[2,3]]" or "name [size=[5]]" or "name [size=[]]"
                        int sizeContentStart = variableName.indexOf('[', sizeIdx + 6); // skip past "[size="
                        int sizeContentEnd   = variableName.indexOf(']', sizeContentStart + 1);

                        String sizeContent = "";
                        if (sizeContentStart != -1 && sizeContentEnd != -1) {
                            sizeContent = variableName.substring(sizeContentStart + 1, sizeContentEnd).trim();
                            // sizeContent is now "2,3" or "5" or "" or "?"
                        }

                        if (sizeContent.contains(",")) {
                            // ---- 2D array: "2,3" → nested OCCURS ----
                            String[] dimParts = sizeContent.split(",");
                            String dim0 = dimParts[0].trim();
                            String dim1 = dimParts[1].trim();
                            String rowName = cobolVarname + "-ROW";
                            String grpName = cobolVarname + "-ARRAY";

                            writer.printf("       01  %-15s.%n", grpName);
                            writer.printf("           05  %-12s OCCURS %s TIMES.%n", rowName, dim0);
                            writer.printf("               10  %-8s %s OCCURS %s TIMES.%n",
                                    cobolVarname, mapJavaTypeToCobolPic(currType).replace(".", ""), dim1);

                            if (currScope.contains("METHOD")) {
                                methodVariables.computeIfAbsent(currMethodName, k -> new ArrayList<>())
                                        .add(new String[]{grpName, "GROUP"});
                                methodVariables.get(currMethodName).add(new String[]{
                                        cobolVarname,
                                        mapJavaTypeToCobolPic(currType).replace(".", "")
                                        + " OCCURS " + dim0 + " TIMES"
                                });
                            }

                        } else if (!sizeContent.isEmpty() && sizeContent.matches("\\d+")) {
                            // ---- 1D array with known size ----
                            arraySize = sizeContent;
                            String arrayGrpName = cobolVarname + "-ARRAY";
                            writer.printf("       01  %-15s.%n", arrayGrpName);
                            writer.printf("           05  %-12s %s OCCURS %s TIMES.%n",
                                    cobolVarname, mapJavaTypeToCobolPic(currType).replace(".", ""), arraySize);
                            // Emit companion -MAX variable for enhanced-for loops
                            writer.printf("       01  %-15s PIC S9(9) VALUE %s.%n",
                                    cobolVarname + "-MAX", arraySize);

                            if (currScope.contains("METHOD")) {
                                methodVariables.computeIfAbsent(currMethodName, k -> new ArrayList<>())
                                        .add(new String[]{arrayGrpName, "GROUP"});
                                methodVariables.get(currMethodName).add(new String[]{
                                        cobolVarname,
                                        mapJavaTypeToCobolPic(currType).replace(".", "") + " OCCURS " + arraySize + " TIMES"
                                });
                            }

                        } else {
                            // ---- 1D array with unknown size → default 100 ----
                            String arrayGrpName = cobolVarname + "-ARRAY";
                            writer.printf("       01  %-15s.%n", arrayGrpName);
                            writer.printf("           05  %-12s %s OCCURS 100 TIMES.%n",
                                    cobolVarname, mapJavaTypeToCobolPic(currType).replace(".", ""));
                            // Emit companion -MAX variable (default 100)
                            writer.printf("       01  %-15s PIC S9(9) VALUE 100.%n",
                                    cobolVarname + "-MAX");

                            if (currScope.contains("METHOD")) {
                                methodVariables.computeIfAbsent(currMethodName, k -> new ArrayList<>())
                                        .add(new String[]{arrayGrpName, "GROUP"});
                                methodVariables.get(currMethodName).add(new String[]{
                                        cobolVarname,
                                        mapJavaTypeToCobolPic(currType).replace(".", "") + " OCCURS 100 TIMES"
                                });
                            }
                        }
                    } else {
                        // cobolVarname = variableName.toUpperCase();
                        cobolVarname=variableName;
                        writer.printf("       01  %-15s %s%n", cobolVarname, mapJavaTypeToCobolPic(currType));

                        if (currScope.contains("METHOD")) {
                            methodVariables.computeIfAbsent(currMethodName, k -> new ArrayList<>())
                                    .add(new String[]{cobolVarname, mapJavaTypeToCobolPic(currType)});
                        }
                    }
                }
            }

            // Write additional data division files for methods
            for (String methodName : methodVariables.keySet()) {
                generateMethodDataDivision(methodName, methodVariables.get(methodName));
            }
        }
    }

    private static void generateMethodDataDivision(String methodName, List<String[]> variables) throws IOException {
        String newCblFile = methodName + ".cbl";

        if (methodName.contains("MAIN")) {
            return;  // Skip MAIN method
        }

        try (PrintWriter writer = new PrintWriter(new FileWriter(newCblFile))) {
            writer.println("       IDENTIFICATION DIVISION.");
            writer.println("       PROGRAM-ID. " + methodName + ".");
            writer.println();
            writer.println();
            writer.println("       DATA DIVISION.");
            writer.println("       WORKING-STORAGE SECTION.");
            writer.println("      * Variables for Method:" + methodName);

            for (String[] var : variables) {
                if (var[1].equals("GROUP")) {
                    writer.printf("       01  %-15s.%n", var[0]);
                } else {
                    writer.printf("           05  %-12s %s%n", var[0], var[1]);
                }
            }
        }
    }
}
