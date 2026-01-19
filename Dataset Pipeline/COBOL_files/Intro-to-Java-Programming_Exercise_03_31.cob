       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_03_31.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_03_31_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_03_31_GLOBAL
       01  input_main      PIC X(100).
       01  rate_main       PIC S9(5)V9(2).
       01  amount_main     PIC S9(5)V9(2).
       01  option_main     PIC S9(5).
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
      * Create a Scanner object
      * Input from ODT is enabled
      * Prompt the user to enter the exchange rate from USD to RMB
       DISPLAY "Enter the exchange rate from dollars to RMB: " WITH NO ADVANCING
       ACCEPT rate_main
      * Prompt the user to enter 0 to convert from USD to RMB
      * and 1 to convert from RMB to USD
       DISPLAY "Enter 0 to convert dollars to RMB and 1 vice versa: " WITH NO ADVANCING
       ACCEPT option_main
      * Prompt the user to enter the amount in USD or RMB
      * to convert it to RMB or USD respectively
       EVALUATE option_main
       WHEN 0
       DISPLAY "Enter the dollar amount: " WITH NO ADVANCING
       ACCEPT amount_main
       DISPLAY "$"
       DISPLAY amount_main
       DISPLAY " is "
       COMPUTE TEMP_1 = amount_main * rate_main
       COMPUTE TEMP_0 = TEMP_1
       DISPLAY TEMP_0
       DISPLAY " yuan"
       WHEN 1
       DISPLAY "Enter the RMB amount: " WITH NO ADVANCING
       ACCEPT amount_main
       DISPLAY amount_main
       DISPLAY " yuan is $"
       COMPUTE TEMP_3 = amount_main * 100
       COMPUTE TEMP_4 = TEMP_3 / rate_main
       COMPUTE TEMP_5 = 100 / 0
       COMPUTE TEMP_2 = TEMP_5
       DISPLAY TEMP_2
       WHEN OTHER
       DISPLAY "Incorrect input"
       END-EVALUATE
       EXIT.


