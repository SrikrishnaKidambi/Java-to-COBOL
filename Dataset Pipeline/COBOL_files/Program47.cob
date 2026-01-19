       IDENTIFICATION DIVISION.
       PROGRAM-ID. Program47.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_PROGRAM47_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_PROGRAM47_GLOBAL
       01  a_main          PIC S9(5).
       01  b_main          PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 3 TO a_main
       MOVE 5 TO b_main
       IF a_main < b_main
       ADD a_main TO b_main GIVING a_main
       END-IF
       DISPLAY a_main
       EXIT.


