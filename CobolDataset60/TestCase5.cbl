       IDENTIFICATION DIVISION.
       PROGRAM-ID. TestCase5.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_-ARRAY    .
           05  args         PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  maxChar         PIC X(5).
       01  minChar         PIC X(5).


       PROCEDURE DIVISION.


       MAIN-PARA.
       MOVE FUNCTION CHAR(FUNCTION ORD-MAX("A" "b" "Z" "x")) TO maxChar
       MOVE FUNCTION CHAR(FUNCTION ORD-MIN("A" "b" "Z" "x")) TO minChar
       DISPLAY "Max char: "   maxChar
      * x
      * x
       DISPLAY "Min char: "   minChar
       EXIT.
       STOP RUN.

