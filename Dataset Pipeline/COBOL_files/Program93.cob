       IDENTIFICATION DIVISION.
       PROGRAM-ID. Program93.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_PROGRAM93_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_PROGRAM93_GLOBAL
       01  a_main          PIC S9(5).
       01  b_main          PIC S9(5).
       01  sum_main        PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_PROGRAM93_GLOBAL
       01  j_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 4 TO a_main
       MOVE 6 TO b_main
       MOVE 0 TO sum_main
       COMPUTE TEMP_0 = a_main + b_main
       PERFORM VARYING j_main FROM 0 BY 1 UNTIL NOT (j_main < TEMP_0)
       ADD sum_main TO j_main GIVING sum_main
       COMPUTE TEMP_0 = a_main + b_main
       END-PERFORM
       DIVIDE sum_main BY 2 GIVING TEMP_1 REMAINDER TEMP_1
       IF TEMP_1 = 0
       DISPLAY "Even Sum: "
       DISPLAY sum_main
       ELSE
       DISPLAY "Odd Sum: "
       DISPLAY sum_main
       END-IF
       EXIT.


