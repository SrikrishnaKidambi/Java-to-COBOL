       IDENTIFICATION DIVISION.
       PROGRAM-ID. Program61_SumEvenOdd.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_PROGRAM61_SUMEVENODD_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_PROGRAM61_SUMEVENODD_GLOBAL
       01  ARR_MAIN_-ARRAY.
           05  arr_main     PIC S9(5) OCCURS 100 TIMES.
       01  evenSum_main    PIC S9(5).
       01  oddSum_main     PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_PROGRAM61_SUMEVENODD_GLOBAL
       01  i_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).
       01 TEMP_4 PIC S9(9).
       01 TEMP_5 PIC S9(9).
       01 TEMP_6 PIC S9(9).
       01 TEMP_7 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 0 TO evenSum_main
       MOVE 0 TO oddSum_main
       PERFORM VARYING i_main FROM 0 BY 1 UNTIL NOT (i_main < arr_main.length)
       COMPUTE TEMP_1 = i_main + 1
       DIVIDE TEMP_1 BY 2 GIVING TEMP_2 REMAINDER TEMP_3
       COMPUTE TEMP_0 = TEMP_3
       IF TEMP_0 = 0
       COMPUTE TEMP_4 = i_main + 1
       COMPUTE TEMP_5 = arr_main + TEMP_4
       COMPUTE evenSum_main = TEMP_5
       ELSE
       COMPUTE TEMP_6 = i_main + 1
       COMPUTE TEMP_7 = arr_main + TEMP_6
       COMPUTE oddSum_main = TEMP_7
       END-IF
       END-PERFORM
       DISPLAY "Even Sum = "
       DISPLAY evenSum_main
       DISPLAY "Odd Sum = "
       DISPLAY oddSum_main
       EXIT.


