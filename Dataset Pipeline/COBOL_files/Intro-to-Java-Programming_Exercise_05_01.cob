       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_05_01.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_05_01_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_01_GLOBAL
       01  input_main      PIC X(100).
       01  positives_main  PIC S9(5).
       01  negatives_main  PIC S9(5).
       01  count_main      PIC S9(5).
       01  number_main     PIC S9(5).
       01  total_main      PIC S9(5)V9(2).
       01  average_main    PIC S9(5)V9(2).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
      * Count the number of positive numbers
       MOVE 0 TO positives_main
      * Count the number of negative numbers
       MOVE 0 TO negatives_main
      * Count all numbers
       MOVE 0 TO count_main
      * Accumulate a totol
       MOVE 0 TO total_main
      * Promopt the user to enter an integer or 0 to exit
       DISPLAY "Enter an integer, the input ends if it is 0: " WITH NO ADVANCING
       ACCEPT number_main
       IF number_main = 0
      * Test for sentinel value
       DISPLAY "No numbers are entered except 0"
       STOP RUN
       END-IF
       PERFORM UNTIL NOT (number_main NOT = 0)
      * Test for sentinel value
       IF number_main > 0
      * Increase positives
       ADD 1 TO positives_main
      * Increase negatives
       ELSE
       ADD 1 TO negatives_main
       END-IF
      * Accumulate total
       ADD total_main TO number_main GIVING total_main
      * Increase the count
       ADD 1 TO count_main
       ACCEPT number_main
       END-PERFORM
      * Calculate the average
       DIVIDE total_main BY count_main GIVING average_main
      * Display results
       DISPLAY "The number of positive is "
       DISPLAY positives_main
       DISPLAY "\nThe number of negatives is "
       DISPLAY negatives_main
       DISPLAY "\nThe total is total "
       DISPLAY total_main
       DISPLAY "\nThe average is "
       DISPLAY average_main
       EXIT.


