       IDENTIFICATION DIVISION.
       PROGRAM-ID. Program55_CheckDivisible.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_PROGRAM55_CHECKDIVISIBLE_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_PROGRAM55_CHECKDIVISIBLE_GLOBAL
       01  num_main        PIC S9(5).
       01 TEMP_0 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 45 TO num_main
       DIVIDE num_main BY 9 GIVING TEMP_0 REMAINDER TEMP_0
       IF TEMP_0 = 0
       DISPLAY 1
       ELSE
       DISPLAY 0
       END-IF
       EXIT.


