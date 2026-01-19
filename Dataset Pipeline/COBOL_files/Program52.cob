       IDENTIFICATION DIVISION.
       PROGRAM-ID. Program52.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_PROGRAM52_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_PROGRAM52_GLOBAL
       01  x_main          PIC S9(5).
       01  y_main          PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 5 TO x_main
       MOVE 1 TO y_main
       PERFORM WITH TEST AFTER
       MULTIPLY y_main BY x_main GIVING y_main
       SUBTRACT 1 FROM x_main GIVING x_main
       END-PERFORM UNTIL NOT (x_main > 0)
       DISPLAY y_main
       EXIT.


