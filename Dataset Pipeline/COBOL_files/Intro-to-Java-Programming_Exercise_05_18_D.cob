       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_05_18_D.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_05_18_D_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_18_D_GLOBAL
       01  rows_main       PIC S9(5).
      * Variables for Scope:FOR_BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_18_D_GLOBAL
       01  ws_main         PIC S9(5).
       01  col_main        PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Display pattern D
       DISPLAY "Pattern D"
       PERFORM VARYING rows_main FROM 0 BY 1 UNTIL NOT (rows_main < 6)
      * Print rows
       PERFORM VARYING ws_main FROM 0 BY 1 UNTIL NOT (ws_main < rows_main)
      * Print white space
       DISPLAY "  " WITH NO ADVANCING
       END-PERFORM
       COMPUTE TEMP_0 = 6 - rows_main
       PERFORM VARYING col_main FROM 0 BY 1 UNTIL NOT (col_main < TEMP_0)
      * Print numbers
       COMPUTE TEMP_2 = col_main + 1
       COMPUTE TEMP_1 = TEMP_2
       DISPLAY TEMP_1 WITH NO ADVANCING
       DISPLAY " " WITH NO ADVANCING
       COMPUTE TEMP_0 = 6 - rows_main
       END-PERFORM
      * Print newline
       END-PERFORM
       EXIT.


