       IDENTIFICATION DIVISION.
       PROGRAM-ID. Program67_SumUntilLimit.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_PROGRAM67_SUMUNTILLIMIT_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_PROGRAM67_SUMUNTILLIMIT_GLOBAL
       01  sum_main        PIC S9(5).
       01  i_main          PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 0 TO sum_main
       MOVE 1 TO i_main
       PERFORM UNTIL NOT (sum_main < 50)
       ADD sum_main TO i_main GIVING sum_main
       ADD 1 TO i_main
       END-PERFORM
       DISPLAY "Final Sum = "
       DISPLAY sum_main
       EXIT.


