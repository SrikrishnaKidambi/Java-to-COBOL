       IDENTIFICATION DIVISION.
       PROGRAM-ID. Program60_CountEvenOddArray.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_PROGRAM60_COUNTEVENODDARRAY_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_PROGRAM60_COUNTEVENODDARRAY_GLOBAL
       01  ARR_MAIN_-ARRAY.
           05  arr_main     PIC S9(5) OCCURS 100 TIMES.
       01  even_main       PIC S9(5).
       01  odd_main        PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_PROGRAM60_COUNTEVENODDARRAY_GLOBAL
       01  i_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       PERFORM VARYING i_main FROM 0 BY 1 UNTIL NOT (i_main < arr_main.length)
       COMPUTE TEMP_1 = i_main + 1
       DIVIDE TEMP_1 BY 2 GIVING TEMP_2 REMAINDER TEMP_3
       COMPUTE TEMP_0 = TEMP_3
       IF TEMP_0 = 0
       ADD 1 TO even_main
       ELSE
       ADD 1 TO odd_main
       END-IF
       END-PERFORM
       DISPLAY even_main
       DISPLAY odd_main
       EXIT.


