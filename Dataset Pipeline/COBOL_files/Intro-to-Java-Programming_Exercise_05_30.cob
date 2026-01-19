       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_05_30.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_05_30_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_30_GLOBAL
       01  input_main      PIC X(100).
       01  amount_main     PIC S9(5)V9(2).
       01  annualInterestRate_main PIC S9(5)V9(2).
       01  monthlyInterestRate_main PIC S9(5)V9(2).
       01  compoundValue_main PIC S9(5)V9(2).
       01  months_main     PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_30_GLOBAL
       01  m_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).
       01 TEMP_4 PIC S9(9).
       01 TEMP_5 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Create a Scanner
      * Input from ODT is enabled
      * Prompt the user to enter an amount, the
      * annual interest rate and the number of months
       DISPLAY "Enter an amount (e.g., 100): " WITH NO ADVANCING
       ACCEPT amount_main
       DISPLAY "Enter the annual interest rate (e.g., 5): " WITH NO ADVANCING
       ACCEPT annualInterestRate_main
       DISPLAY "Enter the number of months (e.g., 6): " WITH NO ADVANCING
       ACCEPT months_main
      * Compute monthly interest rate
       DIVIDE annualInterestRate_main BY 1200 GIVING monthlyInterestRate_main
      * Compute amount in the savings account after the given month
      * Accumulates compount value
       MOVE 0 TO compoundValue_main
       PERFORM VARYING m_main FROM 1 BY 1 UNTIL NOT (m_main <= months_main)
       COMPUTE TEMP_0 = amount_main + compoundValue_main
       COMPUTE TEMP_1 = 1 + monthlyInterestRate_main
       COMPUTE TEMP_2 = TEMP_0 * TEMP_1
       COMPUTE compoundValue_main = TEMP_2
       END-PERFORM
      * Display result
       DISPLAY "Amount in savings account after " WITH NO ADVANCING
       DISPLAY months_main WITH NO ADVANCING
       DIVIDE n BY compoundValue_main GIVING TEMP_4 REMAINDER TEMP_5
       COMPUTE TEMP_3 = TEMP_5
       DISPLAY TEMP_3 WITH NO ADVANCING
       EXIT.


