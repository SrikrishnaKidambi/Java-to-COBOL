       IDENTIFICATION DIVISION.
       PROGRAM-ID. Program65_MaxMinArray.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_PROGRAM65_MAXMINARRAY_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_PROGRAM65_MAXMINARRAY_GLOBAL
       01  ARR_MAIN_-ARRAY.
           05  arr_main     PIC S9(5) OCCURS 100 TIMES.
       01  max_main        PIC S9(5).
       01  min_main        PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_PROGRAM65_MAXMINARRAY_GLOBAL
       01  i_main          PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE arr_main(1) TO max_main
       MOVE arr_main(1) TO min_main
       PERFORM VARYING i_main FROM 1 BY 1 UNTIL NOT (i_main < arr_main.length)
       IF arr_main[i_main] > max_main
       MOVE arr_main(i_main + 1) TO max_main
       END-IF
       IF arr_main[i_main] < min_main
       MOVE arr_main(i_main + 1) TO min_main
       END-IF
       END-PERFORM
       DISPLAY "Max = "
       DISPLAY max_main
       DISPLAY "Min = "
       DISPLAY min_main
       EXIT.


