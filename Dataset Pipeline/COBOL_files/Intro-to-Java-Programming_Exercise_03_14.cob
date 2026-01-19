       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_03_14.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_03_14_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_03_14_GLOBAL
       01  input_main      PIC X(100).
       01  coin_main       PIC S9(5).
       01  guess_main      PIC S9(5).
       01 TEMP_0 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
      * Generate a random integer 0 or 1
       COMPUTE TEMP_0 = RANDOM * 2
       COMPUTE coin_main = TEMP_0
      * Prompt the user to enter a guess
       DISPLAY "Enter a guess 0-head or 1-tail: " WITH NO ADVANCING
       ACCEPT guess_main
      * Display result
       DISPLAY ((guess_main == coin_main) ? "Correct" : "Incorrect")
       DISPLAY " guess."
       EXIT.


