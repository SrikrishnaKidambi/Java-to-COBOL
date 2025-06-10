       IDENTIFICATION DIVISION.
       PROGRAM-ID. TestCase4.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_-ARRAY    .
           05  args         PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ch1              PIC X(100).
       01  name1            PIC X(100).
       01  code1            PIC S9(5).


       PROCEDURE DIVISION.


       MAIN-PARA.
       MOVE "a" TO ch1
       COMPUTE code1 = FUNCTION ORD(ch1)
       DISPLAY "CodePoint: "   code1
      * 97
       MOVE "java" TO name1
       DISPLAY "Uppercase: "   FUNCTION UPPER-CASE(name1)
       EXIT.
       STOP RUN.

