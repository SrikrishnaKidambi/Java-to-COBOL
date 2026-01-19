       IDENTIFICATION DIVISION.
       PROGRAM-ID. Program35_FibonacciLoop.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_PROGRAM35_FIBONACCILOOP_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_PROGRAM35_FIBONACCILOOP_GLOBAL
       01  n1_main         PIC S9(5).
       01  n2_main         PIC S9(5).
       01  n3_main         PIC S9(5).
       01  count_main      PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_PROGRAM35_FIBONACCILOOP_GLOBAL
       01  i_main          PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 0 TO n1_main
       MOVE 1 TO n2_main
       MOVE 8 TO count_main
       DISPLAY n1_main
       DISPLAY n2_main
       PERFORM VARYING i_main FROM 2 BY 1 UNTIL NOT (i_main < count_main)
       ADD n1_main TO n2_main GIVING n3_main
       DISPLAY n3_main
       MOVE n2_main TO n1_main
       MOVE n3_main TO n2_main
       END-PERFORM
       EXIT.


