       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_02_21.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_02_21_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_02_21_GLOBAL
       01  input_main      PIC X(100).
       01  amount_main     PIC S9(5)V9(2).
       01  monthlyInterestRate_main PIC S9(5)V9(2).
       01  futureInvestmentValue_main PIC S9(5)V9(2).
       01  years_main      PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
      * Prompt the user to enter the investment amount,
      * annual interest rate and number of years.
       DISPLAY "Enter investment amount: " WITH NO ADVANCING
       ACCEPT amount_main
       DISPLAY "Enter annual interest rate in percentage: " WITH NO ADVANCING
       ACCEPT monthlyInterestRate_main
       DIVIDE monthlyInterestRate_main BY 1200 GIVING monthlyInterestRate_main
       DISPLAY "Enter number of years: " WITH NO ADVANCING
       ACCEPT years_main
      * Calculate future investment value
       COMPUTE TEMP_0 = years_main * 12
       COMPUTE TEMP_1 = monthlyInterestRate_main + TEMP_0
       COMPUTE TEMP_2 = 1 * TEMP_1
       COMPUTE futureInvestmentValue_main = TEMP_2
      * Display result
       DISPLAY "Accumulated value is $"
       DISPLAY futureInvestmentValue_main
       EXIT.


