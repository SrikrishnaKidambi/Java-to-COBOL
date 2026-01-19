       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_02_14.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_02_14_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_02_14_GLOBAL
       01  input_main      PIC X(100).
       01  KILOGRAMS_PER_POUND_main PIC S9(5)V9(2).
       01  METERS_PER_INCH_main PIC S9(5)V9(2).
       01  weight_main     PIC S9(5)V9(2).
       01  height_main     PIC S9(5)V9(2).
       01  bodyMassIndex_main PIC S9(5)V9(2).
       01 TEMP_0 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
      * Prompt the user to enter a weight in pounds
       DISPLAY "Enter weight in pounds: " WITH NO ADVANCING
       ACCEPT weight_main
      * Prompt the user to enter height in inches
       DISPLAY "Enter height in inches: " WITH NO ADVANCING
       ACCEPT height_main
      * Convert weight to kilograms
       MULTIPLY weight_main BY KILOGRAMS_PER_POUND_main GIVING weight_main
      * Convert height to meters
       MULTIPLY height_main BY METERS_PER_INCH_main GIVING height_main
      * Compute BMI
       COMPUTE TEMP_0 = height_main / 2
       COMPUTE bodyMassIndex_main = TEMP_0
      * Display result
       DISPLAY "BMI is "
       DISPLAY bodyMassIndex_main
       EXIT.


