       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_04_16.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_04_16_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_04_16_GLOBAL
       01  number_main     PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Generate a random number between 65 and 90
       COMPUTE TEMP_0 = 91 - 65
       COMPUTE TEMP_1 = RANDOM * TEMP_0
       COMPUTE TEMP_2 = FUNCTION + TEMP_1
       COMPUTE number_main = TEMP_2
      * Display a random uppercase letter
       DISPLAY (char) (number_main)
       EXIT.


