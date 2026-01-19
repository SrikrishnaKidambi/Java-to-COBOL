       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_02_19.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_02_19_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_02_19_GLOBAL
       01  input_main      PIC X(100).
       01  x1_main         PIC S9(5)V9(2).
       01  y1_main         PIC S9(5)V9(2).
       01  x2_main         PIC S9(5)V9(2).
       01  y2_main         PIC S9(5)V9(2).
       01  x3_main         PIC S9(5)V9(2).
       01  y3_main         PIC S9(5)V9(2).
       01  side1_main      PIC S9(5)V9(2).
       01  side2_main      PIC S9(5)V9(2).
       01  side3_main      PIC S9(5)V9(2).
       01  s_main          PIC S9(5)V9(2).
       01  area_main       PIC S9(5)V9(2).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).
       01 TEMP_4 PIC S9(9).
       01 TEMP_5 PIC S9(9).
       01 TEMP_6 PIC S9(9).
       01 TEMP_7 PIC S9(9).
       01 TEMP_8 PIC S9(9).
       01 TEMP_9 PIC S9(9).
       01 TEMP_10 PIC S9(9).
       01 TEMP_11 PIC S9(9).
       01 TEMP_12 PIC S9(9).
       01 TEMP_13 PIC S9(9).
       01 TEMP_14 PIC S9(9).
       01 TEMP_15 PIC S9(9).
       01 TEMP_16 PIC S9(9).
       01 TEMP_17 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
      * Prompt the user to enter three points
       DISPLAY "Enter three points for a triangle: " WITH NO ADVANCING
       ACCEPT x1_main
       ACCEPT y1_main
       ACCEPT x2_main
       ACCEPT y2_main
       ACCEPT x3_main
       ACCEPT y3_main
      * Compute the area of a triangle
       COMPUTE TEMP_0 = x1_main - 2
       COMPUTE TEMP_1 = y1_main - 2
       COMPUTE TEMP_2 = 0 + 5
       COMPUTE side1_main = TEMP_2
       COMPUTE TEMP_3 = x2_main - 2
       COMPUTE TEMP_4 = y2_main - 2
       COMPUTE TEMP_5 = 0 + 5
       COMPUTE side2_main = TEMP_5
       COMPUTE TEMP_6 = x3_main - 2
       COMPUTE TEMP_7 = y3_main - 2
       COMPUTE TEMP_8 = 0 + 5
       COMPUTE side3_main = TEMP_8
       COMPUTE TEMP_9 = side1_main + side2_main
       COMPUTE TEMP_10 = TEMP_9 + side3_main
       COMPUTE TEMP_11 = TEMP_10 / 2
       COMPUTE s_main = TEMP_11
       COMPUTE TEMP_12 = s_main - side1_main
       COMPUTE TEMP_13 = s_main * TEMP_12
       COMPUTE TEMP_14 = s_main - side2_main
       COMPUTE TEMP_15 = TEMP_13 * TEMP_14
       COMPUTE TEMP_16 = s_main - side3_main
       COMPUTE TEMP_17 = 0 * 5
       COMPUTE area_main = TEMP_17
      * Display result
       DISPLAY "The area of the triangle is "
       DISPLAY area_main
       EXIT.


