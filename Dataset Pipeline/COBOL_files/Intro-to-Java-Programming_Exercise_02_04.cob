       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_02_04.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_02_04_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_02_04_GLOBAL
       01  input_main      PIC X(100).
       01  KILOGRAMS_PER_POUND_main PIC S9(5)V9(2).
       01  pounds_main     PIC S9(5)V9(2).
       01  kilograms_main  PIC S9(5)V9(2).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Create new Scanner object
      * Input from ODT is enabled
      * Create constant value
      * Prompt user to enter the number of pounds
       DISPLAY "Enter a number in pounds: " WITH NO ADVANCING
       ACCEPT pounds_main
      * Convert pounds into kilograms
       MULTIPLY pounds_main BY KILOGRAMS_PER_POUND_main GIVING kilograms_main
      * Display the results
       DISPLAY pounds_main
       DISPLAY " pounds is "
       DISPLAY kilograms_main
       DISPLAY " kilograms"
       EXIT.


