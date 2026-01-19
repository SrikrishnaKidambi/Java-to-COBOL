       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_05_43.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_05_43_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_43_GLOBAL
       01  count_main      PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_43_GLOBAL
       01  number1_main    PIC S9(5).
      * Variables for Scope:FOR_BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_43_GLOBAL
       01  number2_main    PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Counts the number of combinations
       MOVE 0 TO count_main
      * Display all possible combination for
      * picking to numbers from integers 1 to 7
       PERFORM VARYING number1_main FROM 1 BY 1 UNTIL NOT (number1_main < 7)
       PERFORM VARYING number2_main FROM number1_main BY 1 UNTIL NOT (number2_main <= 7)
       ADD number1_main TO 1 GIVING number2_main
       DISPLAY number1_main
       DISPLAY " "
       DISPLAY number2_main
      * Increment count
       ADD 1 TO count_main
       END-PERFORM
       END-PERFORM
      * Display total number of all combinations
       DISPLAY "The total number of all combinations is "
       DISPLAY count_main
       EXIT.


