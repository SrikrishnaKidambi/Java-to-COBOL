import java.io.*;
import java.util.*;

public class DataDivisionGen{
    private static String mapJavaTypeToCobolPic(String javaType){
        javaType=javaType.toLowerCase();
        if(javaType.contains("int") || javaType.contains("long")){
            return "PIC 9(5).";
        }else if(javaType.contains("float") || javaType.contains("double")){
            return "PIC 9(5)V9(2).";
        }else if(javaType.contains("char")){
            return "PIC X(1).";
        }else if(javaType.contains("boolean")){
            return "PIC X(1).";
        }else{
            return "PIC X(10).";
        }
    }

    public static void generateDataDivision(String inputFile,String outputFile)throws IOException{
        try(BufferedReader reader=new BufferedReader(new FileReader(inputFile));
        PrintWriter writer=new PrintWriter(new FileWriter(outputFile))){
            String[] cblPgmID=outputFile.split("\\.");    // extracting the name of the cobol file

            writer.println("       IDENTIFICATION DIVISION.");
            writer.println("       PROGRAM-ID. "+cblPgmID[0]+".");
            writer.println();
            writer.println();
            writer.println("       DATA DIVISION.");
            writer.println("       WORKING-STORAGE SECTION.");

            String line;
            String currScope="";
            String currType="";

            Map<String,List<String[]>>methodVariables=new HashMap<>();
            String currMethodName="";

            while((line=reader.readLine())!=null){
                line=line.trim();
                if (line.startsWith("Scope:")) {
                    currScope = line.substring(6).trim().replace("->", "_").replace(":", "_").toUpperCase();
                    writer.println("      * Variables for Scope:" + currScope);

                    if (currScope.contains("METHOD")) {
                        String[] parts = line.split("->");
                        for (String part : parts) {
                            if (part.trim().toLowerCase().startsWith("method:")) {
                                currMethodName = part.split(":")[1].trim();
                            }
                        }
                        methodVariables.put(currMethodName, new ArrayList<>());
                    }
                }else if(line.startsWith("Type:")){
                    currType=line.substring(5).trim();
                }else if(!line.isEmpty()){
                    String variableName=line;
                    String cobolVarname="";
                    String arraySize="";

                    int sizeIdx=variableName.indexOf("[size=");
                    if(sizeIdx!=-1){
                        cobolVarname=variableName.substring(0, sizeIdx).trim().toUpperCase().replace("[SIZE=[]]","");
                        
                        
                        int openingBracket=variableName.indexOf('[',sizeIdx);
                        int closingBracket=variableName.indexOf(']', openingBracket+1);
                       
                        if(openingBracket!=-1 && closingBracket!=-1){
                            arraySize=variableName.substring(openingBracket+1, closingBracket).replaceAll("[^0-9]", "");
                        }
                        if(!arraySize.isEmpty()){
                            String arrayGrpName=cobolVarname+"-ARRAY";
                            writer.printf("       01  %-15s.%n", arrayGrpName);
                            writer.printf("           05  %-12s %s OCCURS %s TIMES.%n", cobolVarname, mapJavaTypeToCobolPic(currType).replace(".", ""), arraySize);

                            if(currScope.contains("METHOD")){
                                methodVariables.get(currScope).add(new String[]{cobolVarname+"-ARRAY","GROUP"});
                                methodVariables.get(currScope).add(new String[]{cobolVarname,mapJavaTypeToCobolPic(currType).replace(".", "")+" OCCURS "+arraySize+" TIMES"});
                            }
                        }else{
                            String arrayGrpName=variableName.toUpperCase().replace(" ", "_")+"-ARRAY";
                            writer.printf("       01  %-15s.%n", arrayGrpName.replace("[SIZE=[]]", ""));
                            writer.printf("           05  %-12s %s OCCURS 100 TIMES.%n", cobolVarname.toUpperCase(), mapJavaTypeToCobolPic(currType).replace(".", ""));
                            if(currScope.contains("METHOD")){
                                methodVariables.get(currScope).add(new String[]{arrayGrpName, "GROUP"});
                                methodVariables.get(currScope).add(new String[]{cobolVarname.toUpperCase(), mapJavaTypeToCobolPic(currType).replace(".", "") + " OCCURS 100 TIMES"});
                            }
                            // System.out.println("The appended that is extracted is:"+mapJavaTypeToCobolPic(currType));
                        }
                    }else{
                        cobolVarname=variableName.toUpperCase();
                        writer.printf("       01  %-15s %s%n", cobolVarname, mapJavaTypeToCobolPic(currType));
                        if(currScope.contains("METHOD")){
                            methodVariables.get(currScope).add(new String[]{cobolVarname, mapJavaTypeToCobolPic(currType)});
                        }
                    }
                }
            }
            
            for(String methodName:methodVariables.keySet()){
                    generateMethodDataDivision(methodName, methodVariables.get(methodName));
            }
        }
    }

    private static void generateMethodDataDivision(String methodName,List<String[]>variables)throws IOException{
        String newCblFile=methodName+".cbl";
        try(PrintWriter writer=new PrintWriter(new FileWriter(newCblFile))){
            writer.println("       IDENTIFICATION DIVISION.");
            writer.println("       PROGRAM-ID. "+methodName+".");
            writer.println();
            writer.println();
            writer.println("       DATA DIVISION.");
            writer.println("       WORKING-STORAGE SECTION.");
            writer.println("      * Variables for Method:"+methodName);


            for(String[] var:variables){
                if(var[1].equals("GROUP")){
                    writer.printf("       01  %-15s.%n", var[0]);
                }else{
                    writer.printf("           05  %-12s %s%n", var[0], var[1]);
                }
            }
        }
    }
}
