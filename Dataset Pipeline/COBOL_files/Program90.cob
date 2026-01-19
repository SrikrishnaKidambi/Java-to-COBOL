       IDENTIFICATION DIVISION.
       PROGRAM-ID. Program90.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_PROGRAM90_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_PROGRAM90_GLOBAL
       01  n_main          PIC S9(5).
       01  i_main          PIC S9(5).
      * Variables for Scope:BLOCK_WHILE_BLOCK_METHOD_MAIN_CLASS_PROGRAM90_GLOBAL
       01  j_main          PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 5 TO n_main
       MOVE 1 TO i_main
       PERFORM UNTIL NOT (i_main <= n_main)
       MOVE 1 TO j_main
       PERFORM UNTIL NOT (j_main <= i_main)
       DISPLAY "*" WITH NO ADVANCING
       ADD 1 TO j_main
       END-PERFORM
       ADD 1 TO i_main
       END-PERFORM
       EXIT.


