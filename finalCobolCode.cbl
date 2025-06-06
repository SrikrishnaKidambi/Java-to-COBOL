       IDENTIFICATION DIVISION.
       PROGRAM-ID. Test.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_-ARRAY    .
           05  args         PIC X(10) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  value           PIC S9(5).


       PROCEDURE DIVISION.


       MAIN-PARA.
       MOVE 50 TO value
       IF value  <  100
       ELSE
       DISPLAY "small"
       EXIT.
       STOP RUN.

