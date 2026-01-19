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
       01  d_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 4 TO a_main
       MOVE 9 TO b_main
       MOVE 10 TO c_main
       COMPUTE TEMP_0 = 5 % 6
       COMPUTE TEMP_1 = 3 - 5 % 9
       DIVIDE TEMP_0 BY TEMP_1 GIVING TEMP_2 REMAINDER TEMP_3
       COMPUTE d_main = TEMP_3
       EXIT.


