       IDENTIFICATION DIVISION.
       PROGRAM-ID. BreakExample.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_-ARRAY    .
           05  args         PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  i               PIC S9(5).
      * Variables for Scope:BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  rem1            PIC S9(5).
       01  rem2            PIC S9(5).


       PROCEDURE DIVISION.


       MAIN-PARA.
       PERFORM VARYING i FROM 1 BY 1 UNTIL NOT (i <= 100)
       DIVIDE i BY 3 GIVING rem1 REMAINDER rem1
       DIVIDE i BY 7 GIVING rem2 REMAINDER rem2
       IF rem1=0 AND rem2=0
       DISPLAY "First number divisible by both 3 and 7 is: "   i
       EXIT PERFORM
       END-IF
       END-PERFORM.
       EXIT.
       STOP RUN.

