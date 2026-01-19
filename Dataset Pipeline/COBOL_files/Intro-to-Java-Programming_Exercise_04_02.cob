       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_04_02.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_04_02_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_04_02_GLOBAL
       01  input_main      PIC X(100).
       01  RADIUS_main     PIC S9(5)V9(2).
       01  x1_main         PIC S9(5)V9(2).
       01  y1_main         PIC S9(5)V9(2).
       01  x2_main         PIC S9(5)V9(2).
       01  y2_main         PIC S9(5)V9(2).
       01  distance_main   PIC S9(5)V9(2).
       01  xy1_main        PIC X(100).
       01  xy2_main        PIC X(100).
       01  k_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).
       01 TEMP_4 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
      * Constant value
      * Prompt the user to enter the latitude and longitude
      * of two points on the earth in degrees
       DISPLAY "Enter point 1 (latitude and longitude) in degrees: " WITH NO ADVANCING
       ACCEPT xy1_main
       DISPLAY "Enter point 2 (latitude and longitude) in degrees: " WITH NO ADVANCING
       ACCEPT xy2_main
      * Extract x and y values from string
       COMPUTE k_main = ORD
       COMPUTE TEMP_0 = k_main - 1
       COMPUTE x1_main = TEMP_0
       COMPUTE TEMP_1 = k_main + 2
       COMPUTE y1_main = TEMP_1
       COMPUTE k_main = ORD
       COMPUTE TEMP_2 = k_main - 1
       COMPUTE x2_main = TEMP_2
       COMPUTE TEMP_3 = k_main + 2
       COMPUTE y2_main = TEMP_3
      * Convert degrees to radians
       COMPUTE x1_main = x1_main
       COMPUTE y1_main = y1_main
       COMPUTE x2_main = x2_main
       COMPUTE y2_main = y2_main
      * Calculate its great circle distance
       COMPUTE TEMP_4 = FUNCTION * ACOS
       COMPUTE distance_main = TEMP_4
      * Display result
       DISPLAY "The distance between the two points is "
       DISPLAY distance_main
       EXIT.


