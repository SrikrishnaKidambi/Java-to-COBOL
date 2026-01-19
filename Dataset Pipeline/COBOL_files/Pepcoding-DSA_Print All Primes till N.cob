       IDENTIFICATION DIVISION.
       PROGRAM-ID. Pepcoding-DSA_Print All Primes till N.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  scn_main        PIC X(100).
       01  lo_main         PIC S9(5).
       01  hi_main         PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  n_main          PIC S9(5).
      * Variables for Scope:BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  factors_main    PIC S9(5).
      * Variables for Scope:FOR_BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  div_main        PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
       ACCEPT lo_main
       ACCEPT hi_main
       PERFORM VARYING n_main FROM lo_main BY 1 UNTIL NOT (n_main <= hi_main)
       MOVE 0 TO factors_main
       COMPUTE TEMP_0 = div_main * div_main
       PERFORM VARYING div_main FROM 2 BY 1 UNTIL NOT (TEMP_0 <= n_main)
       DIVIDE n_main BY div_main GIVING TEMP_1 REMAINDER TEMP_1
       IF TEMP_1 = 0
       ADD factors_main TO 1 GIVING factors_main
       EXIT PERFORM
       END-IF
       COMPUTE TEMP_0 = div_main * div_main
       END-PERFORM
       IF factors_main = 0
       DISPLAY n_main
       END-IF
       END-PERFORM
       EXIT.


