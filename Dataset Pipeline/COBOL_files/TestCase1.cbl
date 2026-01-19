       IDENTIFICATION DIVISION.
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
       STOP RUN.