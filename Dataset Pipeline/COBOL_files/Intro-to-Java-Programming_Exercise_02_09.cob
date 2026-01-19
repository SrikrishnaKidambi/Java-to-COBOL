       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_02_09.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_02_09_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_02_09_GLOBAL
       01  input_main      PIC X(100).
       01  v0_main         PIC S9(5)V9(2).
       01  v1_main         PIC S9(5)V9(2).
       01  t_main          PIC S9(5)V9(2).
       01  a_main          PIC S9(5)V9(2).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Create a Scanner object
      * Input from ODT is enabled
      * Prompt the user to enter the starting velocity v0 in meters/second.
      * The ending velocity v1 in meters/second, and the time span t in seconds.
       DISPLAY "Enter v0, v1 and t: " WITH NO ADVANCING
       ACCEPT v0_main
       ACCEPT v1_main
       ACCEPT t_main
      * Calculate the average acceleration
       COMPUTE TEMP_0 = v1_main - v0_main
       COMPUTE TEMP_1 = TEMP_0 / t_main
       COMPUTE a_main = TEMP_1
      * Display result
       DISPLAY "The average acceleration is "
       DISPLAY a_main
       EXIT.


