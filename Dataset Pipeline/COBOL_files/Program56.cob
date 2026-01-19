       IDENTIFICATION DIVISION.
       PROGRAM-ID. Program56.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_PROGRAM56_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_PROGRAM56_GLOBAL
       01  x_main          PIC S9(5).
       01  y_main          PIC S9(5).
       01  max_main        PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 5 TO x_main
       MOVE 7 TO y_main
       IF x_main > y_main
       MOVE x_main TO max_main
       ELSE
       MOVE y_main TO max_main
       END-IF
       DISPLAY max_main
       EXIT.


