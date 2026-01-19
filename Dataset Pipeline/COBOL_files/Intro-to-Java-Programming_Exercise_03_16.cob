       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_03_16.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_03_16_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_03_16_GLOBAL
       01  width_main      PIC S9(5).
       01  height_main     PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).
       01 TEMP_4 PIC S9(9).
       01 TEMP_5 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Generate random width and height
       COMPUTE TEMP_0 = 50 + 50
       COMPUTE TEMP_1 = RANDOM * TEMP_0
       COMPUTE TEMP_2 = TEMP_1 - 50
       COMPUTE width_main = TEMP_2
       COMPUTE TEMP_3 = 100 + 100
       COMPUTE TEMP_4 = RANDOM * TEMP_3
       COMPUTE TEMP_5 = TEMP_4 - 100
       COMPUTE height_main = TEMP_5
      * Display coordinate
       DISPLAY "Random coordinate in rectangle centered at (0,0)"
       DISPLAY "with width 100 and height 200: (" + width_main + ", " + height_main + ")"
       EXIT.


