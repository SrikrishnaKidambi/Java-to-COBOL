       IDENTIFICATION DIVISION.
       PROGRAM-ID. Program79.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_PROGRAM79_CHECKDIVISIBLE_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_PROGRAM79_CHECKDIVISIBLE_GLOBAL
       01  n_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 84 TO n_main
       DIVIDE n_main BY 4 GIVING TEMP_0 REMAINDER TEMP_0
       DIVIDE n_main BY 7 GIVING TEMP_1 REMAINDER TEMP_1
       IF TEMP_0 = 0  AND  TEMP_1 = 0
       DISPLAY 1
       ELSE
       DISPLAY 0
       END-IF
       EXIT.


