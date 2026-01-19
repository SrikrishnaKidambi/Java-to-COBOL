       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_02_13.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_02_13_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_02_13_GLOBAL
       01  input_main      PIC X(100).
       01  MONTHLY_INTEREST_RATE_main PIC S9(5)V9(2).
       01  savingAmount_main PIC S9(5)V9(2).
       01  total_main      PIC S9(5)V9(2).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).
       01 TEMP_4 PIC S9(9).
       01 TEMP_5 PIC S9(9).
       01 TEMP_6 PIC S9(9).
       01 TEMP_7 PIC S9(9).
       01 TEMP_8 PIC S9(9).
       01 TEMP_9 PIC S9(9).
       01 TEMP_10 PIC S9(9).
       01 TEMP_11 PIC S9(9).
       01 TEMP_12 PIC S9(9).
       01 TEMP_13 PIC S9(9).
       01 TEMP_14 PIC S9(9).
       01 TEMP_15 PIC S9(9).
       01 TEMP_16 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Create a new Scanner object.
      * Input from ODT is enabled
      * Initialize constant value
      * Prompt the user to enter a montly saving amount
       DISPLAY "Enter the monthly saving amount: " WITH NO ADVANCING
       ACCEPT savingAmount_main
      * Compute first month account value
       COMPUTE TEMP_0 = 1 + MONTHLY_INTEREST_RATE_main
       COMPUTE TEMP_1 = 100 * TEMP_0
       COMPUTE total_main = TEMP_1
      * Compute second month account value
       COMPUTE TEMP_2 = 100 + total_main
       COMPUTE TEMP_3 = 1 + MONTHLY_INTEREST_RATE_main
       COMPUTE TEMP_4 = TEMP_2 * TEMP_3
       COMPUTE total_main = TEMP_4
      * Compute third month account value
       COMPUTE TEMP_5 = 100 + total_main
       COMPUTE TEMP_6 = 1 + MONTHLY_INTEREST_RATE_main
       COMPUTE TEMP_7 = TEMP_5 * TEMP_6
       COMPUTE total_main = TEMP_7
      * Compute forth month account value
       COMPUTE TEMP_8 = 100 + total_main
       COMPUTE TEMP_9 = 1 + MONTHLY_INTEREST_RATE_main
       COMPUTE TEMP_10 = TEMP_8 * TEMP_9
       COMPUTE total_main = TEMP_10
      * Compute fifth month account value
       COMPUTE TEMP_11 = 100 + total_main
       COMPUTE TEMP_12 = 1 + MONTHLY_INTEREST_RATE_main
       COMPUTE TEMP_13 = TEMP_11 * TEMP_12
       COMPUTE total_main = TEMP_13
      * Compute sixth month account value
       COMPUTE TEMP_14 = 100 + total_main
       COMPUTE TEMP_15 = 1 + MONTHLY_INTEREST_RATE_main
       COMPUTE TEMP_16 = TEMP_14 * TEMP_15
       COMPUTE total_main = TEMP_16
      * Display result
       DISPLAY "After the sixth month, the account value is "
       DISPLAY total_main
       EXIT.


