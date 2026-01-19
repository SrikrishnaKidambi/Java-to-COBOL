       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_NthFibonacciNum.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_NTHFIBONACCINUM_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_NTHFIBONACCINUM_GLOBAL
       01  scan_main       PIC X(100).
       01  n_main          PIC S9(5).
       01  a_main          PIC S9(5).
       01  b_main          PIC S9(5).
       01  c_main          PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_NTHFIBONACCINUM_GLOBAL
       01  i_main          PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
       ACCEPT n_main
       MOVE 0 TO c_main
       PERFORM VARYING i_main FROM 2 BY 1 UNTIL NOT (i_main < n_main)
       ADD a_main TO b_main GIVING c_main
       MOVE b_main TO a_main
       MOVE c_main TO b_main
       END-PERFORM
       DISPLAY c_main WITH NO ADVANCING
       EXIT.


