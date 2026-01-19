       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_05_13.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_05_13_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_13_GLOBAL
       01  n_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Intialize n at 0;
       MOVE 0 TO n_main
      * Find the largest n such that n^3 is < 12,000
       COMPUTE TEMP_0 = Math.pow(n_main + 1, 3)
       PERFORM UNTIL NOT (TEMP_0 < 12000)
      * Increment n
       ADD 1 TO n_main
       COMPUTE TEMP_0 = Math.pow(n_main + 1, 3)
       END-PERFORM
      * Display result
       DISPLAY "Largest integer n such that n^3 is less than 12,000: "
       DISPLAY n_main
       EXIT.


