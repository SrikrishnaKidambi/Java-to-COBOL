       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_02_03.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_02_03_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_02_03_GLOBAL
       01  input_main      PIC X(100).
       01  METERS_PER_FOOT_main PIC S9(5)V9(2).
       01  feet_main       PIC S9(5)V9(2).
       01  meters_main     PIC S9(5)V9(2).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Create a Scanner object
      * Input from ODT is enabled
      * Create constant value
      * Prompt user to enter a number in feet
       DISPLAY "Enter a value for feet: " WITH NO ADVANCING
       ACCEPT feet_main
      * Convert feet into meters
       MULTIPLY feet_main BY METERS_PER_FOOT_main GIVING meters_main
      * Display results
       DISPLAY feet_main
       DISPLAY " feet is "
       DISPLAY meters_main
       DISPLAY " meters"
       EXIT.


