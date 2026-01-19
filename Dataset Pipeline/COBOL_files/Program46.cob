       IDENTIFICATION DIVISION.
       PROGRAM-ID. Program46.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_PROGRAM46_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_PROGRAM46_GLOBAL
       01  x_main          PIC S9(5).
       01  y_main          PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 8 TO x_main
       MOVE 2 TO y_main
       PERFORM UNTIL NOT (x_main > y_main)
       SUBTRACT y_main FROM x_main GIVING x_main
       END-PERFORM
       DISPLAY x_main
       EXIT.


