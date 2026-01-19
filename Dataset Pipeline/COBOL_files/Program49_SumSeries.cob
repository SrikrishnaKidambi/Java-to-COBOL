       IDENTIFICATION DIVISION.
       PROGRAM-ID. Program49_SumSeries.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_PROGRAM49_SUMSERIES_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_PROGRAM49_SUMSERIES_GLOBAL
       01  i_main          PIC S9(5).
       01  sum_main        PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 1 TO i_main
       MOVE 0 TO sum_main
       PERFORM UNTIL NOT (i_main <= 100)
       ADD sum_main TO i_main GIVING sum_main
       ADD i_main TO 1 GIVING i_main
       END-PERFORM
       DISPLAY sum_main
       EXIT.


