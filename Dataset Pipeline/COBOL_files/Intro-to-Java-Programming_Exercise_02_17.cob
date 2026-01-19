       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_02_17.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_02_17_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_02_17_GLOBAL
       01  input_main      PIC X(100).
       01  temperature_main PIC S9(5)V9(2).
       01  speed_main      PIC S9(5)V9(2).
       01  windChill_main  PIC S9(5)V9(2).
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
      * Input from ODT is enabled
      * Prompt the user to enter a temperature between -58F and
      * 41F and a wind speed greater than or equal to 2.
       DISPLAY "Enter the temperature in Fahrenheit " WITH NO ADVANCING
       DISPLAY "between -58ºF and 41ºF: " WITH NO ADVANCING
       ACCEPT temperature_main
       DISPLAY "Enter the wind speed (>= 2) in miles per hour: " WITH NO ADVANCING
       ACCEPT speed_main
      * Compute the wind chill index
       COMPUTE TEMP_0 = 6215 * temperature_main
       COMPUTE TEMP_1 = 0 + TEMP_0
       COMPUTE TEMP_2 = 0 * 16
       COMPUTE TEMP_3 = speed_main - TEMP_2
       COMPUTE TEMP_4 = 4275 * temperature_main
       COMPUTE TEMP_5 = 0 * 16
       COMPUTE TEMP_6 = speed_main + TEMP_5
       COMPUTE windChill_main = TEMP_6
      * Display result
       DISPLAY "The wind chill index is "
       DISPLAY windChill_main
       EXIT.


