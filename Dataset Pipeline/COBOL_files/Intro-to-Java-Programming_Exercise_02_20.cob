       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_02_20.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_02_20_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_02_20_GLOBAL
       01  input_main      PIC X(100).
       01  balance_main    PIC S9(5)V9(2).
       01  annualInterestRate_main PIC S9(5)V9(2).
       01  interest_main   PIC S9(5)V9(2).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
      * Prompt the user to enter a balance and
      * the annual percentage interest rate
       DISPLAY "Enter balance and interest rate (e.g., 3 for 3%): " WITH NO ADVANCING
       ACCEPT balance_main
       ACCEPT annualInterestRate_main
      * Calculate the interest
       COMPUTE TEMP_0 = annualInterestRate_main / 1200
       COMPUTE TEMP_1 = balance_main * TEMP_0
       COMPUTE interest_main = TEMP_1
      * Display result
       DISPLAY "The interest is "
       DISPLAY interest_main
       EXIT.


