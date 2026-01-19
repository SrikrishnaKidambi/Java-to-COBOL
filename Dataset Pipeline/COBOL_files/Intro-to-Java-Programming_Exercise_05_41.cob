       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_05_41.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_05_41_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_41_GLOBAL
       01  input_main      PIC X(100).
       01  max_main        PIC S9(5).
       01  count_main      PIC S9(5).
       01  number_main     PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
      * Prompt the user to enter number
       DISPLAY "Enter numbers: " WITH NO ADVANCING
      * Assign the first number to max
       ACCEPT max_main
      * Assign 1 to count
       MOVE 1 TO count_main
      * Holds future inputs
      * Assume that the input ends with number 0
       PERFORM UNTIL NOT (number_main > 0)
       ACCEPT number_main
       IF number_main > max_main
       MOVE number_main TO max_main
       MOVE 1 TO count_main
       END-IF
       IF number_main = max_main
       ADD 1 TO count_main
       END-IF
       END-PERFORM
      * Display to results
       DISPLAY "The largest number is "
       DISPLAY max_main
       DISPLAY "The occurrence count of the largest number is "
       DISPLAY count_main
       EXIT.


