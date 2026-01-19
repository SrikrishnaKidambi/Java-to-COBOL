       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_03_29.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_03_29_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_03_29_GLOBAL
       01  input_main      PIC X(100).
       01  x1_main         PIC S9(5)V9(2).
       01  y1_main         PIC S9(5)V9(2).
       01  r1_main         PIC S9(5)V9(2).
       01  x2_main         PIC S9(5)V9(2).
       01  y2_main         PIC S9(5)V9(2).
       01  r2_main         PIC S9(5)V9(2).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).
       01 TEMP_4 PIC S9(9).
       01 TEMP_5 PIC S9(9).
       01 TEMP_6 PIC S9(9).
       01 TEMP_7 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Create a new Scanner
      * Input from ODT is enabled
      * Prompt the user to enter the center coordinates and radii of two circles
       DISPLAY "Enter circle1's center x-, y-coordinates, and radius: " WITH NO ADVANCING
       ACCEPT x1_main
       ACCEPT y1_main
       ACCEPT r1_main
       DISPLAY "Enter circle2's center x-, y-coordinates, and radius: " WITH NO ADVANCING
       ACCEPT x2_main
       ACCEPT y2_main
       ACCEPT r2_main
       COMPUTE TEMP_1 = x1_main - 2
       COMPUTE TEMP_2 = y1_main - 2
       COMPUTE TEMP_3 = 0 + 5
       COMPUTE TEMP_0 = TEMP_3
       IF TEMP_0 <= Math.abs(r1_main - r2_main)
       DISPLAY "circle2 is inside circle1"
       ELSE
       COMPUTE TEMP_5 = x1_main - 2
       COMPUTE TEMP_6 = y1_main - 2
       COMPUTE TEMP_7 = 0 + 5
       COMPUTE TEMP_4 = TEMP_7
       IF TEMP_4 <= r1_main + r2_main
       DISPLAY "circle2 overlaps circle1"
       ELSE
       DISPLAY "circle2 does not overlap circle1"
       END-IF
       END-IF
       EXIT.


