       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_EvenOddSum.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EVENODDSUM_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EVENODDSUM_GLOBAL
       01  scan_main       PIC X(100).
       01  N_main          PIC S9(5).
       01  oddsum_main     PIC S9(5).
       01  evensum_main    PIC S9(5).
      * Variables for Scope:BLOCK_WHILE_BLOCK_METHOD_MAIN_CLASS_EVENODDSUM_GLOBAL
       01  rem_main        PIC S9(5).
       01 TEMP_0 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Write your code here
      * Input from ODT is enabled
       ACCEPT N_main
       PERFORM UNTIL NOT (N_main > 0)
       DIVIDE N_main BY 10 GIVING rem_main REMAINDER rem_main
       DIVIDE rem_main BY 2 GIVING TEMP_0 REMAINDER TEMP_0
       IF TEMP_0 = 0
       ADD evensum_main TO rem_main GIVING evensum_main
       ELSE
       ADD oddsum_main TO rem_main GIVING oddsum_main
       END-IF
       DIVIDE N_main BY 10 GIVING N_main
       END-PERFORM
       DISPLAY evensum_main
       DISPLAY " "
       DISPLAY oddsum_main
       EXIT.


