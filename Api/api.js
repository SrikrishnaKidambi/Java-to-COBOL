import express from "express";
import cors from "cors";
import { exec as callbackExec }from "child_process";
import { writeFile,readFile } from "fs/promises";
import path from "path";
import { fileURLToPath } from "url";
import util from "util";

// Promisify the exec function to use it with keywords and functionality like async/await

const exec = util.promisify(callbackExec);

// define the __dirname and all

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const app = express();
const port = 3000;

app.use(express.json());
app.use(cors()); //Allows all origins to use the api

// async function getCobolCode(javaCode){
//     //Saiman write your code here.

//     //the below return is for testing purpose
//     const cobolCode = `       IDENTIFICATION DIVISION.
//        PROGRAM-ID. TestCase1.

//        DATA DIVISION.
//        WORKING-STORAGE SECTION.
//       * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
//        01  ARGS_-ARRAY    .
//            05  args         PIC X(100) OCCURS 100 TIMES.
//       * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
//        01  a               PIC S9(5).
//        01  b               PIC S9(5).
//        01  minVal          PIC S9(5).
//        01  modVal          PIC S9(5).
//        01  signVal         PIC S9(5).

//        PROCEDURE DIVISION.

//        MAIN-PARA.
//        MOVE 15 TO a
//        MOVE 9 TO b
//        COMPUTE minVal = FUNCTION MIN(a  b)
//        COMPUTE modVal = FUNCTION MOD(-7  b)
//        COMPUTE signVal = FUNCTION SIGN(-5)
//        DISPLAY "Min: "   minVal
//       * 9
//       * 9
//        DISPLAY "Mod: "   modVal
//       * 2
//       * 2
//        DISPLAY "Sign: "   signVal
//        EXIT.
//        STOP RUN.`;
//     return cobolCode;
// }

async function getCobolCode(javaCode){
    console.log("Starting the conversion from Java to COBOL ...");

    // Define the paths relative to the current api script
    // __dirname points to the directory of the current module 

    const projectRoot = path.join(__dirname,'..');  // go one level above the current directory to access the root directory of the tool
    const antlrDir = path.join(projectRoot,'Antlr');    // from the root directory of the tool, go to Antlr folder
    const javaTestFilePath = path.join(antlrDir,'Test.java');   // from the Antlr directory point to the java input
    const cobolOutputPath = path.join(projectRoot,'finalCobolCode.cbl');

    try{
        const classNameRegex = /public\s+class\s+(\w+)/;
        const match = javaCode.match(classNameRegex);

        if(!match){
            throw new Error("No valid public class found in the provided Java code.");
        }

        const originalClassName = match[1];
        console.log(`Original class name found : ${originalClassName}`);
        
        const modifiedJavaCode = javaCode.replace(`public class ${originalClassName}`, "public class Test");

        await writeFile(javaTestFilePath,modifiedJavaCode,'utf8');
        console.log(`Successfully written modified java code to : ${javaTestFilePath}`);
        
        const separator = process.platform === "win32" ? ";" : ":";
        const command = `java -cp ".${separator}antlr-4.13.2-complete.jar${separator}javaparser-core-3.25.8.jar" TestJavaVariableScoping Test.java && java -cp ".${separator}javaparser-core-3.25.8.jar${separator}antlr-4.13.2-complete.jar" ParseTreeGeneration ${originalClassName}`;

        // Execute the java command
        const { stdout,stderr } = await exec(command,{cwd:antlrDir});
        if(stderr){
            console.error("Execution error:",stderr);
        }

        console.log("Exection output:",stdout);
        console.log("Command execution completed successfully");

        // Read the generated cobol code 
        const cobolCode = await readFile(cobolOutputPath,'utf8');
        console.log("Completed reading the generated cobol code from :",cobolOutputPath);

        return cobolCode;
    }catch(error){
        console.error("An error occured during the conversion process :",error);
        throw new Error("Failed to convert the Java to COBOL :", error.message);
    }
}


app.post("/convert",async (req,res)=>{
    const javaCode = req.body.javaCode;
    const cobolCode = await getCobolCode(javaCode);
    res.json({
        cobolCode: cobolCode,
    })
});

app.get("/",(req,res)=>{
    res.send("API is working");
});

app.listen(port,()=>{
    console.log(`listening on the port ${port}`);
});