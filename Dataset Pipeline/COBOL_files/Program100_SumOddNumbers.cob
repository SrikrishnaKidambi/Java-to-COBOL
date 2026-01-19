       IDENTIFICATION DIVISION.
       PROGRAM-ID. Program100_SumOddNumbers.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_PROGRAM100_SUMODDNUMBERS_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_PROGRAM100_SUMODDNUMBERS_GLOBAL
       01  sum_main        PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_PROGRAM100_SUMODDNUMBERS_GLOBAL
       01  i_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 0 TO sum_main
       PERFORM VARYING i_main FROM 1 BY 1 UNTIL NOT (i_main <= 20)
       DIVIDE i_main BY 2 GIVING TEMP_0 REMAINDER TEMP_0
       IF TEMP_0 != 0
       ADD sum_main TO i_main GIVING sum_main
       END-IF
       END-PERFORM
       DISPLAY sum_main
       EXIT.


