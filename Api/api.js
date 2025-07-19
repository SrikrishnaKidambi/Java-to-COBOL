import express from "express";
import cors from "cors";

const app = express();
const port = 3000;

app.use(express.json());
app.use(cors()); //Allows all origins to use the api

async function getCobolCode(javaCode){
    //Saiman write your code here.

    //the below return is for testing purpose
    const cobolCode = `       IDENTIFICATION DIVISION.
       PROGRAM-ID. TestCase1.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_-ARRAY    .
           05  args         PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  a               PIC S9(5).
       01  b               PIC S9(5).
       01  minVal          PIC S9(5).
       01  modVal          PIC S9(5).
       01  signVal         PIC S9(5).

       PROCEDURE DIVISION.

       MAIN-PARA.
       MOVE 15 TO a
       MOVE 9 TO b
       COMPUTE minVal = FUNCTION MIN(a  b)
       COMPUTE modVal = FUNCTION MOD(-7  b)
       COMPUTE signVal = FUNCTION SIGN(-5)
       DISPLAY "Min: "   minVal
      * 9
      * 9
       DISPLAY "Mod: "   modVal
      * 2
      * 2
       DISPLAY "Sign: "   signVal
       EXIT.
       STOP RUN.`;
    return cobolCode;
}


app.post("/convert",async (req,res)=>{
    const javaCode = req.body.javaCode;
    const cobolCode = await getCobolCode();
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