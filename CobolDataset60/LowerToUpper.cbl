       IDENTIFICATION DIVISION.
       PROGRAM-ID. LowerToUpper.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_-ARRAY    .
           05  args         PIC X(10) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  sc              PIC X(10).
       01  ch1              PIC X(1).
       01  upper           PIC X(1).


       PROCEDURE DIVISION.


       MAIN-PARA.
      * Input from ODT is enabled
       DISPLAY "Enter a lowercase letter: " WITH NO ADVANCING
       ACCEPT ch1
       MOVE FUNCTION CHAR((FUNCTION ORD(ch1) - 32)) TO upper
       DISPLAY "Uppercase: "   upper
       EXIT.
       STOP RUN.

