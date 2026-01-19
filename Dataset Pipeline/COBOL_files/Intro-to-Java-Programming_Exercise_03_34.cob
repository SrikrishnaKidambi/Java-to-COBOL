       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_03_34.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_03_34_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_03_34_GLOBAL
       01  input_main      PIC X(100).
       01  x0_main         PIC S9(5)V9(2).
       01  y0_main         PIC S9(5)V9(2).
       01  x1_main         PIC S9(5)V9(2).
       01  y1_main         PIC S9(5)V9(2).
       01  x2_main         PIC S9(5)V9(2).
       01  y2_main         PIC S9(5)V9(2).
       01  online_main     PIC X(1).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Create Scanner
      * Input from ODT is enabled
      * Prompt the user to enter the three points for p0, p1, and p2
       DISPLAY "Enter three points for p0, p1, and p2: " WITH NO ADVANCING
       ACCEPT x0_main
       ACCEPT y0_main
       ACCEPT x1_main
       ACCEPT y1_main
       ACCEPT x2_main
       ACCEPT y2_main
      * Calculate point in on line segment
      * Display result
       DISPLAY "(" + x2_main + ", " + y2_main + ") is " WITH NO ADVANCING
       IF !online_main
       DISPLAY "not " WITH NO ADVANCING
       END-IF
       DISPLAY "on the line segment from (" + x0_main + ", " + y0_main + ") to (" + x1_main + ", " + y1_main + ")"
       EXIT.


