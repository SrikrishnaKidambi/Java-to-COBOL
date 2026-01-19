       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_03_19.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_03_19_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_03_19_GLOBAL
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
       01  valid_main      PIC X(1).
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


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
      * Prompt the user to enter three edges for a triangle
       DISPLAY "Enter three edges for a triangle:"
       DISPLAY " Edge 1 points x, y: " WITH NO ADVANCING
       ACCEPT x1_main
       ACCEPT y1_main
       DISPLAY " Edge 2 points x, y: " WITH NO ADVANCING
       ACCEPT x2_main
       ACCEPT y2_main
       DISPLAY " Edge 3 points x, y: " WITH NO ADVANCING
       ACCEPT x3_main
       ACCEPT y3_main
      * Test if input is valid
       IF !valid_main
       DISPLAY "Input is invalid."
       STOP RUN
       END-IF
      * Compute the sides of the triangle
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
      * Display the perimeter of the triangle
       DISPLAY "perimeter of triangle is "
       COMPUTE TEMP_10 = side1_main + side2_main
       COMPUTE TEMP_11 = TEMP_10 + side3_main
       COMPUTE TEMP_9 = TEMP_11
       DISPLAY TEMP_9
       EXIT.


