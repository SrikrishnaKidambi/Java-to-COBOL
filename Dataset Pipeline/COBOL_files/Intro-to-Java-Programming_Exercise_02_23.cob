       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_02_23.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_02_23_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_02_23_GLOBAL
       01  input_main      PIC X(100).
       01  distace_main    PIC S9(5)V9(2).
       01  milesPerGallon_main PIC S9(5)V9(2).
       01  pricePerGallon_main PIC S9(5)V9(2).
       01  costOfDriving_main PIC S9(5)V9(2).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
      * Prompt the user to enter the distace to drive, the fuel
      * efficiency of the car in miles and the price per gallon.
       DISPLAY "Enter the driving distace: " WITH NO ADVANCING
       ACCEPT distace_main
       DISPLAY "Enter miles per gallon: " WITH NO ADVANCING
       ACCEPT milesPerGallon_main
       DISPLAY "Enter price per gallon: " WITH NO ADVANCING
       ACCEPT pricePerGallon_main
      * Compute the cost of driving
       COMPUTE TEMP_0 = distace_main / milesPerGallon_main
       COMPUTE TEMP_1 = TEMP_0 * pricePerGallon_main
       COMPUTE costOfDriving_main = TEMP_1
      * Display result
       DISPLAY "The cost of driving is $"
       DISPLAY costOfDriving_main
       EXIT.


