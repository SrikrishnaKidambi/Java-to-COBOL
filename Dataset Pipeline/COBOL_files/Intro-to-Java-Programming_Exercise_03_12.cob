       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_03_12.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_03_12_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_03_12_GLOBAL
       01  input_main      PIC X(100).
       01  number_main     PIC S9(5).
       01  digit1_main     PIC S9(5).
       01  remaining_main  PIC S9(5).
       01  digit3_main     PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
      * Prompt the user to enter a three-digit integer
       DISPLAY "Enter a three-digit integer: " WITH NO ADVANCING
       ACCEPT number_main
      * Test for palindrome
       COMPUTE TEMP_0 = number_main / 100
       COMPUTE digit1_main = TEMP_0
       DIVIDE number_main BY 100 GIVING remaining_main REMAINDER remaining_main
       DIVIDE remaining_main BY 10 GIVING TEMP_1 REMAINDER TEMP_2
       COMPUTE digit3_main = TEMP_2
      * Display result
       DISPLAY number_main
       DISPLAY ((digit1_main == digit3_main) ? " is a " : " is not a ")
       DISPLAY "palindrome"
       EXIT.


