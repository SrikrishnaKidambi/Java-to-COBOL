       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_02_06.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_02_06_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_02_06_GLOBAL
       01  input_main      PIC X(100).
       01  number_main     PIC S9(5).
       01  lessThan10_main PIC S9(5).
       01  tens_main       PIC S9(5).
       01  hundreds_main   PIC S9(5).
       01  sum_main        PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Create new Scanner object
      * Input from ODT is enabled
      * Prompt the user to enter a number between 0 and 1000.
       DISPLAY "Enter a number between 0 and 1000: " WITH NO ADVANCING
       ACCEPT number_main
      * Compute the sum of the digits in the integer.
      * Extract the digit less than 10
       DIVIDE number_main BY 10 GIVING lessThan10_main REMAINDER lessThan10_main
      * Remove the extracted digit
       DIVIDE number_main BY 10 GIVING number_main
      * Extract the digit between 10 to 99
       DIVIDE number_main BY 10 GIVING tens_main REMAINDER tens_main
      * Remove the extracted digit
       DIVIDE number_main BY 10 GIVING number_main
      * Extract the digit between 100 to 999
       DIVIDE number_main BY 10 GIVING hundreds_main REMAINDER hundreds_main
      * Remove the extracted digit
       DIVIDE number_main BY 10 GIVING number_main
       COMPUTE TEMP_0 = hundreds_main + tens_main
       COMPUTE TEMP_1 = TEMP_0 + lessThan10_main
       COMPUTE sum_main = TEMP_1
      * Display results
       DISPLAY "The sum of the digits is "
       DISPLAY sum_main
       EXIT.


