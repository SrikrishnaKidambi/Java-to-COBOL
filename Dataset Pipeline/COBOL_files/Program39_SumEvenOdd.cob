       IDENTIFICATION DIVISION.
       PROGRAM-ID. Program39_SumEvenOdd.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_PROGRAM39_SUMEVENODD_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_PROGRAM39_SUMEVENODD_GLOBAL
       01  n_main          PIC S9(5).
       01  evenSum_main    PIC S9(5).
       01  oddSum_main     PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_PROGRAM39_SUMEVENODD_GLOBAL
       01  i_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 10 TO n_main
       MOVE 0 TO evenSum_main
       MOVE 0 TO oddSum_main
       PERFORM VARYING i_main FROM 1 BY 1 UNTIL NOT (i_main <= n_main)
       DIVIDE i_main BY 2 GIVING TEMP_0 REMAINDER TEMP_0
       IF TEMP_0 = 0
       ADD evenSum_main TO i_main GIVING evenSum_main
       ELSE
       ADD oddSum_main TO i_main GIVING oddSum_main
       END-IF
       END-PERFORM
       DISPLAY evenSum_main
       DISPLAY oddSum_main
       EXIT.


