       IDENTIFICATION DIVISION.
       PROGRAM-ID. Program65.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_PROGRAM65_SUMOFDIGITS_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_PROGRAM65_SUMOFDIGITS_GLOBAL
       01  num_main        PIC S9(5).
       01  sum_main        PIC S9(5).
      * Variables for Scope:BLOCK_WHILE_BLOCK_METHOD_MAIN_CLASS_PROGRAM65_SUMOFDIGITS_GLOBAL
       01  d_main          PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 345 TO num_main
       MOVE 0 TO sum_main
       PERFORM UNTIL NOT (num_main > 0)
       DIVIDE num_main BY 10 GIVING d_main REMAINDER d_main
       ADD sum_main TO d_main GIVING sum_main
       DIVIDE num_main BY 10 GIVING num_main
       END-PERFORM
       DISPLAY sum_main
       EXIT.


