       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_02_15.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_02_15_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_02_15_GLOBAL
       01  input_main      PIC X(100).
       01  x1_main         PIC S9(5)V9(2).
       01  y1_main         PIC S9(5)V9(2).
       01  x2_main         PIC S9(5)V9(2).
       01  y2_main         PIC S9(5)V9(2).
       01  distance_main   PIC S9(5)V9(2).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
      * Prompt the user to enter two points
       DISPLAY "Enter x1 and y1: " WITH NO ADVANCING
       ACCEPT x1_main
       ACCEPT y1_main
       DISPLAY "Enter x2 and y2: " WITH NO ADVANCING
       ACCEPT x2_main
       ACCEPT y2_main
      * Calucate the distance between the two points
       COMPUTE TEMP_0 = x1_main - 2
       COMPUTE TEMP_1 = y1_main - 2
       COMPUTE TEMP_2 = 0 + 5
       COMPUTE distance_main = TEMP_2
      * Display result
       DISPLAY "The distance between the two points is "
       DISPLAY distance_main
       EXIT.


