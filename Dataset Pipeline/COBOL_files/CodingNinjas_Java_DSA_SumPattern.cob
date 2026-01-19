       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_SumPattern.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_SUMPATTERN_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_SUMPATTERN_GLOBAL
       01  scan_main       PIC X(100).
       01  N_main          PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_SUMPATTERN_GLOBAL
       01  i_main          PIC S9(5).
      * Variables for Scope:BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_SUMPATTERN_GLOBAL
       01  sum_main        PIC S9(5).
      * Variables for Scope:FOR_BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_SUMPATTERN_GLOBAL
       01  j_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Write your code here
      * Input from ODT is enabled
       ACCEPT N_main
       PERFORM VARYING i_main FROM 1 BY 1 UNTIL NOT (i_main <= N_main)
       MOVE 1 TO sum_main
       IF i_main = 1
       DISPLAY "1=1"
       ELSE
       DISPLAY "1 WITH NO ADVANCING
       DISPLAY " WITH NO ADVANCING
       END-IF
       PERFORM VARYING j_main FROM 2 BY 1 UNTIL NOT (j_main <= i_main)
       COMPUTE TEMP_0 = sum_main + j_main
       COMPUTE sum_main = TEMP_0
       DISPLAY j_main WITH NO ADVANCING
       IF j_main < i_main
       DISPLAY " WITH NO ADVANCING
       DISPLAY " WITH NO ADVANCING
       ELSE
       DISPLAY "="
       DISPLAY sum_main
       END-IF
       END-PERFORM
       END-PERFORM
       EXIT.


