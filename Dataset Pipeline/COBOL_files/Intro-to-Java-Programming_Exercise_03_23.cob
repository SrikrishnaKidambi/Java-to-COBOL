       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_03_23.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_03_23_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_03_23_GLOBAL
       01  input_main      PIC X(100).
       01  x_main          PIC S9(5)V9(2).
       01  y_main          PIC S9(5)V9(2).
       01  withinRectangle_main PIC X(1).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
      * Prompt the user to enter a point (x, y)
       DISPLAY "Enter a point with two coordinates: " WITH NO ADVANCING
       ACCEPT x_main
       ACCEPT y_main
      * Check whether the point is within the rectangle
      * centered at (0, 0) with width 10 and height 5
      * Display results
       DISPLAY "Point (" + x_main + ", " + y_main + ") is "
       DISPLAY ((withinRectangle_main) ? "in " : "not in ")
       DISPLAY "the rectangle"
       EXIT.


