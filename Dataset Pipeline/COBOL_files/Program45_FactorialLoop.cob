       IDENTIFICATION DIVISION.
       PROGRAM-ID. Program45_FactorialLoop.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_PROGRAM45_FACTORIALLOOP_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_PROGRAM45_FACTORIALLOOP_GLOBAL
       01  n_main          PIC S9(5).
       01  fact_main       PIC S9(5).
       01  i_main          PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 6 TO n_main
       MOVE 1 TO fact_main
       MOVE 1 TO i_main
       PERFORM UNTIL NOT (i_main <= n_main)
       MULTIPLY fact_main BY i_main GIVING fact_main
       ADD i_main TO 1 GIVING i_main
       END-PERFORM
       DISPLAY fact_main
       EXIT.


