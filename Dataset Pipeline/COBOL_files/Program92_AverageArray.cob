       IDENTIFICATION DIVISION.
       PROGRAM-ID. Program92_AverageArray.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_PROGRAM92_AVERAGEARRAY_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_PROGRAM92_AVERAGEARRAY_GLOBAL
       01  ARR_MAIN_-ARRAY.
           05  arr_main     PIC S9(5) OCCURS 100 TIMES.
       01  sum_main        PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_PROGRAM92_AVERAGEARRAY_GLOBAL
       01  i_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 0 TO sum_main
       PERFORM VARYING i_main FROM 0 BY 1 UNTIL NOT (i_main < 4)
       COMPUTE TEMP_0 = i_main + 1
       COMPUTE TEMP_1 = arr_main + TEMP_0
       COMPUTE sum_main = TEMP_1
       END-PERFORM
       DIVIDE sum_main BY 4 GIVING TEMP_2
       DISPLAY TEMP_2
       EXIT.


