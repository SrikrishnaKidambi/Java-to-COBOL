       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_04_05.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_04_05_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_04_05_GLOBAL
       01  input_main      PIC X(100).
       01  numberOfSides_main PIC S9(5).
       01  side_main       PIC S9(5)V9(2).
       01  area_main       PIC S9(5)V9(2).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
      * Prompt the user to enter the number of sides
      * and their length of a regular polygon
       DISPLAY "Enter the number of sides: " WITH NO ADVANCING
       ACCEPT numberOfSides_main
       DISPLAY "Enter the side: " WITH NO ADVANCING
       ACCEPT side_main
      * Compute the area of a regular polygon
       COMPUTE TEMP_0 = side_main * 2
       COMPUTE TEMP_1 = PI / numberOfSides_main
       COMPUTE TEMP_2 = Math * TEMP_1
       COMPUTE TEMP_3 = TAN / TEMP_2
       COMPUTE area_main = TEMP_3
      * Display result
       DISPLAY "The area of the polygon is "
       DISPLAY area_main
       EXIT.


