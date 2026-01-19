       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_02_16.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_02_16_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_02_16_GLOBAL
       01  input_main      PIC X(100).
       01  side_main       PIC S9(5)V9(2).
       01  area_main       PIC S9(5)V9(2).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
      * Prompt the user to enter the side of a hexagon
       DISPLAY "Enter the side: " WITH NO ADVANCING
       ACCEPT side_main
      * Compute the area of the hexagon
       COMPUTE TEMP_0 = 0 * 5
       COMPUTE TEMP_1 = TEMP_0 / 2
       COMPUTE TEMP_2 = side_main * 2
       COMPUTE area_main = TEMP_2
      * Display result
       DISPLAY "The area of the hexagon is "
       DISPLAY area_main
       EXIT.


