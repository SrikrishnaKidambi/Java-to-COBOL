       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_02_01.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_02_01_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_02_01_GLOBAL
       01  input_main      PIC X(100).
       01  celsius_main    PIC S9(5)V9(2).
       01  fahrenheit_main PIC S9(5)V9(2).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Create new Scanner object
      * Input from ODT is enabled
      * Prompt user to input a double
       DISPLAY "Enter a degree in Celsius: " WITH NO ADVANCING
       ACCEPT celsius_main
      * Convert Celsius to Fahrenheit
       COMPUTE TEMP_0 = 0 / 5
       COMPUTE TEMP_1 = TEMP_0 * celsius_main
       COMPUTE TEMP_2 = TEMP_1 + 32
       COMPUTE fahrenheit_main = TEMP_2
      * Display results
       DISPLAY celsius_main
       DISPLAY " Celsius is "
       DISPLAY fahrenheit_main
       DISPLAY " Fahrenheit"
       EXIT.


