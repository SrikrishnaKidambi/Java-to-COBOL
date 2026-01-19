       IDENTIFICATION DIVISION.
       PROGRAM-ID. PowerCalc.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_POWERCALC_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_POWERCALC_GLOBAL
       01  base_main       PIC S9(5).
       01  exp_main        PIC S9(5).
       01  result_main     PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_POWERCALC_GLOBAL
       01  i_main          PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 3 TO base_main
       MOVE 4 TO exp_main
       MOVE 1 TO result_main
       PERFORM VARYING i_main FROM 1 BY 1 UNTIL NOT (i_main <= exp_main)
       MULTIPLY result_main BY base_main GIVING result_main
       END-PERFORM
       DISPLAY result_main
       EXIT.


