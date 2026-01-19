       IDENTIFICATION DIVISION.
       PROGRAM-ID. Program86.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_PROGRAM86_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_PROGRAM86_GLOBAL
       01  a_main          PIC S9(5).
       01  b_main          PIC S9(5).
       01  c_main          PIC S9(5).
       01  max_main        PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 5 TO a_main
       MOVE 3 TO b_main
       MOVE 8 TO c_main
       MOVE a_main TO max_main
       IF b_main > max_main
       MOVE b_main TO max_main
       END-IF
       IF c_main > max_main
       MOVE c_main TO max_main
       END-IF
       DISPLAY max_main
       EXIT.


