       IDENTIFICATION DIVISION.
       PROGRAM-ID. Program83.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_PROGRAM83_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_PROGRAM83_GLOBAL
       01  x_main          PIC S9(5).
       01  y_main          PIC S9(5).
       01  z_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 3 TO x_main
       MOVE 4 TO y_main
       MOVE 5 TO z_main
       COMPUTE TEMP_1 = x_main * x_main
       COMPUTE TEMP_2 = y_main * y_main
       COMPUTE TEMP_3 = TEMP_1 + TEMP_2
       COMPUTE TEMP_0 = TEMP_3
       IF TEMP_0 = z_main * z_main
       DISPLAY "Right Triangle"
       ELSE
       DISPLAY "Not Right"
       END-IF
       EXIT.


