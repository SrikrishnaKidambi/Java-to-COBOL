       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_02_10.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_02_10_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_02_10_GLOBAL
       01  input_main      PIC X(100).
       01  kilograms_main  PIC S9(5)V9(2).
       01  initialTemperature_main PIC S9(5)V9(2).
       01  finalTemperature_main PIC S9(5)V9(2).
       01  energy_main     PIC S9(5)V9(2).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Create new Scanner object.
      * Input from ODT is enabled
      * Prompt the user to enter the amount of water in kilograms.
       DISPLAY "Enter the amount of water in kilograms: " WITH NO ADVANCING
       ACCEPT kilograms_main
      * Prompt the user to enter the initial temperature.
       DISPLAY "Enter the initial temperature: " WITH NO ADVANCING
       ACCEPT initialTemperature_main
      * Prompt the user to enter the final temperature.
       DISPLAY "Enter the final temperature: " WITH NO ADVANCING
       ACCEPT finalTemperature_main
      * Calculate the energy
       COMPUTE TEMP_0 = finalTemperature_main - initialTemperature_main
       COMPUTE TEMP_1 = kilograms_main * TEMP_0
       COMPUTE TEMP_2 = TEMP_1 * 4184
       COMPUTE energy_main = TEMP_2
      * Display result
       DISPLAY "The energy needed is "
       DISPLAY energy_main
       EXIT.


