       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_05_16.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_05_16_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_16_GLOBAL
       01  input_main      PIC X(100).
       01  number_main     PIC S9(5).
       01  index_main      PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Create a Scanner
      * Input from ODT is enabled
      * Prompt the user to enter an integer
       DISPLAY "Enter an integer: " WITH NO ADVANCING
       ACCEPT number_main
      * Numbers to test as factors
       MOVE 2 TO index_main
      * Find and display all the smallest factors in increasing order
       COMPUTE TEMP_0 = number_main / index_main
       PERFORM UNTIL NOT (TEMP_0 NOT = 1)
      * Test as a factor of number
       DIVIDE number_main BY index_main GIVING TEMP_1 REMAINDER TEMP_1
       IF TEMP_1 = 0
       DISPLAY index_main WITH NO ADVANCING
       DISPLAY ", " WITH NO ADVANCING
       DIVIDE number_main BY index_main GIVING number_main
      * Increment index
       ELSE
       ADD 1 TO index_main
       END-IF
       COMPUTE TEMP_0 = number_main / index_main
       END-PERFORM
       DISPLAY number_main
       DISPLAY "."
       EXIT.


