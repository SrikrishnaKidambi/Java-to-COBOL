       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_Premium_SumPattern.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_SUMPATTERN_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_SUMPATTERN_GLOBAL
       01  s_main          PIC X(100).
       01  n_main          PIC S9(5).
       01  currentRow_main PIC S9(5).
       01  sum_main        PIC S9(5).
      * Variables for Scope:BLOCK_WHILE_BLOCK_METHOD_MAIN_CLASS_SUMPATTERN_GLOBAL
       01  currentCol_main PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * TODO Auto-generated method stub
      * Input from ODT is enabled
       ACCEPT n_main
       MOVE 1 TO currentRow_main
       MOVE 0 TO sum_main
       PERFORM UNTIL NOT (currentRow_main <= n_main)
       ADD sum_main TO currentRow_main GIVING sum_main
       MOVE 1 TO currentCol_main
       PERFORM UNTIL NOT (currentCol_main <= currentRow_main)
       DISPLAY currentCol_main WITH NO ADVANCING
       IF currentCol_main = currentRow_main
       DISPLAY '=' WITH NO ADVANCING
       ELSE
       DISPLAY ' WITH NO ADVANCING
       DISPLAY ' WITH NO ADVANCING
       END-IF
       ADD 1 TO currentCol_main
       END-PERFORM
       DISPLAY sum_main
       ADD 1 TO currentRow_main
       END-PERFORM
       EXIT.


