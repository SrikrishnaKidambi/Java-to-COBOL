       IDENTIFICATION DIVISION.
       PROGRAM-ID. MyFirstTest.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TESTSCOPED_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TESTSCOPED_GLOBAL
       01  a_main          PIC S9(5).
       01  b_main          PIC S9(5).
       01  sum_main        PIC S9(5).



       MAIN-PARA.
       MOVE 10 TO a_main
       MOVE 20 TO b_main
       ADD a_main TO b_main GIVING sum_main
       DISPLAY "The sum is: "   sum_main
       STOP RUN.

