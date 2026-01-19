       IDENTIFICATION DIVISION.
       PROGRAM-ID. Program31_SumFirstNNumbers.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_PROGRAM31_SUMFIRSTNNUMBERS_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_PROGRAM31_SUMFIRSTNNUMBERS_GLOBAL
       01  n_main          PIC S9(5).
       01  sum_main        PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_PROGRAM31_SUMFIRSTNNUMBERS_GLOBAL
       01  i_main          PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 10 TO n_main
       MOVE 0 TO sum_main
       PERFORM VARYING i_main FROM 1 BY 1 UNTIL NOT (i_main <= n_main)
       ADD sum_main TO i_main GIVING sum_main
       END-PERFORM
       DISPLAY sum_main
       EXIT.


