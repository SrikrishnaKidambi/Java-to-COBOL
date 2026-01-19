       IDENTIFICATION DIVISION.
       PROGRAM-ID. Program48_CheckMultiple.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_PROGRAM48_CHECKMULTIPLE_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_PROGRAM48_CHECKMULTIPLE_GLOBAL
       01  x_main          PIC S9(5).
       01  y_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 45 TO x_main
       MOVE 9 TO y_main
       DIVIDE x_main BY y_main GIVING TEMP_0 REMAINDER TEMP_0
       IF TEMP_0 = 0
       DISPLAY 1
       ELSE
       DISPLAY 0
       END-IF
       EXIT.


