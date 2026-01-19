       IDENTIFICATION DIVISION.
       PROGRAM-ID. DayOfWeek.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TESTSCOPED_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TESTSCOPED_GLOBAL
       01  a_main          PIC S9(5).
       01  b_main          PIC S9(5).
       01  c_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 4 TO a_main
       MOVE 9 TO b_main
       MOVE 10 TO c_main
       DISPLAY "Result = "
       COMPUTE TEMP_0 = (a_main + b_main * c_main)
       DISPLAY TEMP_0
       EXIT.


