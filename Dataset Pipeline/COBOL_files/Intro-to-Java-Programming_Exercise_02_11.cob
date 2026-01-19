       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_02_11.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_02_11_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_02_11_GLOBAL
       01  input_main      PIC X(100).
       01  years_main      PIC S9(5).
       01  population_main PIC S9(5).
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
      * Create a Scanner object
      * Input from ODT is enabled
      * Prompt the user to the number of years
       DISPLAY "Enter the number of years: " WITH NO ADVANCING
       ACCEPT years_main
      * Calculate population projection
       COMPUTE TEMP_0 = 31536000 / 7
       COMPUTE TEMP_1 = 31536000 / 13
       COMPUTE TEMP_2 = TEMP_0 - TEMP_1
       COMPUTE TEMP_3 = 31536000 / 45
       COMPUTE TEMP_4 = TEMP_2 + TEMP_3
       COMPUTE TEMP_5 = TEMP_4 * years_main
       COMPUTE TEMP_6 = 312032486 + TEMP_5
       COMPUTE population_main = TEMP_6
      * Display the results
       DISPLAY "The population in "
       DISPLAY years_main
       DISPLAY " is "
       DISPLAY population_main
       EXIT.


