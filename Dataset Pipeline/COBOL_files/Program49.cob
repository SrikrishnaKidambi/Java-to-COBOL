       IDENTIFICATION DIVISION.
       PROGRAM-ID. Program49.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_PROGRAM49_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_PROGRAM49_GLOBAL
       01  x_main          PIC S9(5).
       01  y_main          PIC S9(5).
       01  z_main          PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 2 TO x_main
       MOVE 3 TO y_main
       MOVE x_main TO z_main
       MOVE y_main TO x_main
       MOVE z_main TO y_main
       DISPLAY x_main
       DISPLAY y_main
       EXIT.


