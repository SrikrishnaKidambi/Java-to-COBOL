       IDENTIFICATION DIVISION.
       PROGRAM-ID. Program43.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_PROGRAM43_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_PROGRAM43_GLOBAL
       01  x_main          PIC S9(5).
       01  y_main          PIC S9(5).
       01  z_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 5 TO x_main
       MOVE 3 TO y_main
       COMPUTE TEMP_0 = x_main + y_main
       COMPUTE TEMP_1 = TEMP_0 * 2
       COMPUTE z_main = TEMP_1
       DISPLAY z_main
       EXIT.


