       IDENTIFICATION DIVISION.
       PROGRAM-ID. Java-DSA-Bootcamp_Fibo.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_FIBO_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_FIBO_GLOBAL
       01  in_main         PIC X(100).
       01  n_main          PIC S9(5).
       01  a_main          PIC S9(5).
       01  b_main          PIC S9(5).
       01  count_main      PIC S9(5).
      * Variables for Scope:BLOCK_WHILE_BLOCK_METHOD_MAIN_CLASS_FIBO_GLOBAL
       01  temp_main       PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
       ACCEPT n_main
       MOVE 0 TO a_main
       MOVE 1 TO b_main
       MOVE 2 TO count_main
       PERFORM UNTIL NOT (count_main <= n_main)
       MOVE b_main TO temp_main
       ADD b_main TO a_main GIVING b_main
       MOVE temp_main TO a_main
       ADD 1 TO count_main
       END-PERFORM
       DISPLAY b_main
       EXIT.


