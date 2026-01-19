       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_03_32.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_03_32_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_03_32_GLOBAL
       01  input_main      PIC X(100).
       01  x0_main         PIC S9(5)V9(2).
       01  y0_main         PIC S9(5)V9(2).
       01  x1_main         PIC S9(5)V9(2).
       01  y1_main         PIC S9(5)V9(2).
       01  x2_main         PIC S9(5)V9(2).
       01  y2_main         PIC S9(5)V9(2).
       01  position_main   PIC S9(5)V9(2).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).
       01 TEMP_4 PIC S9(9).
       01 TEMP_5 PIC S9(9).
       01 TEMP_6 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Create Scanner object
      * Input from ODT is enabled
      * Prompt the user to enter the three points for p0, p1, and p2
       DISPLAY "Enter three points for p0, p1, and p2: " WITH NO ADVANCING
       ACCEPT x0_main
       ACCEPT y0_main
       ACCEPT x1_main
       ACCEPT y1_main
       ACCEPT x2_main
       ACCEPT y2_main
      * Calculate point position
       COMPUTE TEMP_0 = x1_main - x0_main
       COMPUTE TEMP_1 = y2_main - y0_main
       COMPUTE TEMP_2 = TEMP_0 * TEMP_1
       COMPUTE TEMP_3 = x2_main - x0_main
       COMPUTE TEMP_4 = y1_main - y0_main
       COMPUTE TEMP_5 = TEMP_3 * TEMP_4
       COMPUTE TEMP_6 = TEMP_2 - TEMP_5
       COMPUTE position_main = TEMP_6
      * Display result
       DISPLAY "(" + x2_main + ", " + y2_main + ") is on the " WITH NO ADVANCING
       IF position_main > 0
       DISPLAY "left side of the " WITH NO ADVANCING
       END-IF
       IF position_main < 0
       DISPLAY "right side of the " WITH NO ADVANCING
       END-IF
       DISPLAY "line from (" + x0_main + ", " + y0_main + ") to (" + x1_main + ", " + y1_main + ")"
       EXIT.


