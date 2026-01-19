       IDENTIFICATION DIVISION.
       PROGRAM-ID. Program54.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_PROGRAM54_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_PROGRAM54_GLOBAL
       01  a_main          PIC S9(5).
       01  b_main          PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 12 TO a_main
       MOVE 18 TO b_main
       PERFORM UNTIL NOT (a_main NOT = b_main)
       IF a_main > b_main
       SUBTRACT b_main FROM a_main GIVING a_main
       ELSE
       SUBTRACT a_main FROM b_main GIVING b_main
       END-IF
       END-PERFORM
       DISPLAY a_main
       EXIT.


