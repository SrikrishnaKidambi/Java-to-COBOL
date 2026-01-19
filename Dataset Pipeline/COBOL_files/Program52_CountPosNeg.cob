       IDENTIFICATION DIVISION.
       PROGRAM-ID. Program52_CountPosNeg.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_PROGRAM52_COUNTPOSNEG_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_PROGRAM52_COUNTPOSNEG_GLOBAL
       01  ARR_MAIN_-ARRAY.
           05  arr_main     PIC S9(5) OCCURS 100 TIMES.
       01  pos_main        PIC S9(5).
       01  neg_main        PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_PROGRAM52_COUNTPOSNEG_GLOBAL
       01  i_main          PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       PERFORM VARYING i_main FROM 0 BY 1 UNTIL NOT (i_main < arr_main.length)
       IF arr_main[i_main] > 0
       ADD 1 TO pos_main
       ELSE
       IF arr_main[i_main] < 0
       ADD 1 TO neg_main
       END-IF
       END-IF
       END-PERFORM
       DISPLAY pos_main
       DISPLAY neg_main
       EXIT.


