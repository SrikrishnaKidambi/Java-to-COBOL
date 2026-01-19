       IDENTIFICATION DIVISION.
       PROGRAM-ID. Program87.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_PROGRAM87_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_PROGRAM87_GLOBAL
       01  n_main          PIC S9(5).
       01  t1_main         PIC S9(5).
       01  t2_main         PIC S9(5).
       01  i_main          PIC S9(5).
      * Variables for Scope:BLOCK_WHILE_BLOCK_METHOD_MAIN_CLASS_PROGRAM87_GLOBAL
       01  sum_main        PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 10 TO n_main
       MOVE 0 TO t1_main
       MOVE 1 TO t2_main
       MOVE 1 TO i_main
       PERFORM UNTIL NOT (i_main <= n_main)
       DISPLAY t1_main
       ADD t1_main TO t2_main GIVING sum_main
       MOVE t2_main TO t1_main
       MOVE sum_main TO t2_main
       ADD 1 TO i_main
       END-PERFORM
       EXIT.


