       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_05_40.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_05_40_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_40_GLOBAL
       01  heads_main      PIC S9(5).
       01  tails_main      PIC S9(5).
       01  coin_main       PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_40_GLOBAL
       01  i_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Initialize heads and tails to 0;
       COMPUTE heads_main = 0
      * Simulate flipping a coin one millon times
       DISPLAY "Fipping a coin one millon times.."
       PERFORM VARYING i_main FROM 0 BY 1 UNTIL NOT (i_main < 1000000)
      * Generate randomly 0 or 1.
      * If 0 increament heads otherwise increment tails
       COMPUTE TEMP_0 = RANDOM * 2
       COMPUTE coin_main = tails_main
       ADD 1 TO heads_main.
       ADD 1 TO tails_main.
       END-PERFORM
      * Display results
       DISPLAY "Heads: "
       DISPLAY heads_main
       DISPLAY "\nTails: "
       DISPLAY tails_main
       EXIT.


