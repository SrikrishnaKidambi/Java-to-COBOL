       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_03_07.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_03_07_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_03_07_GLOBAL
       01  input_main      PIC X(100).
       01  amount_main     PIC S9(5)V9(2).
       01  remainingAmount_main PIC S9(5).
       01  numberOfDollars_main PIC S9(5).
       01  numberOfQuarters_main PIC S9(5).
       01  numberOfDimes_main PIC S9(5).
       01  numberOfNickels_main PIC S9(5).
       01  numberOfPennies_main PIC S9(5).
       01 TEMP_0 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Create a Scanner
      * Input from ODT is enabled
      * Receive the amount
       DISPLAY "Enter an amount in double, for example 11.56: " WITH NO ADVANCING
       ACCEPT amount_main
       COMPUTE TEMP_0 = amount_main * 100
       COMPUTE remainingAmount_main = TEMP_0
      * Find the number of one dollars
       DIVIDE remainingAmount_main BY 100 GIVING numberOfDollars_main
       DIVIDE remainingAmount_main BY 100 GIVING remainingAmount_main REMAINDER remainingAmount_main
      * Find the number of quarters in the remaining amount
       DIVIDE remainingAmount_main BY 25 GIVING numberOfQuarters_main
       DIVIDE remainingAmount_main BY 25 GIVING remainingAmount_main REMAINDER remainingAmount_main
      * Find the number of dimes in the remaining amount
       DIVIDE remainingAmount_main BY 10 GIVING numberOfDimes_main
       DIVIDE remainingAmount_main BY 10 GIVING remainingAmount_main REMAINDER remainingAmount_main
      * Find the number of nickels in the remaining amount
       DIVIDE remainingAmount_main BY 5 GIVING numberOfNickels_main
       DIVIDE remainingAmount_main BY 5 GIVING remainingAmount_main REMAINDER remainingAmount_main
      * Find the number of pennies in the remaining amount
       MOVE remainingAmount_main TO numberOfPennies_main
      * Display results
       DISPLAY "Your amount "
       DISPLAY amount_main
       DISPLAY " consists of"
       DISPLAY " "
       DISPLAY numberOfDollars_main
       DISPLAY (numberOfDollars_main == 1 ? " dollar" : " dollars")
       DISPLAY " "
       DISPLAY numberOfQuarters_main
       DISPLAY (numberOfQuarters_main == 1 ? " quarter" : " quarters")
       DISPLAY " "
       DISPLAY numberOfDimes_main
       DISPLAY (numberOfDimes_main == 1 ? " dime" : " dimes")
       DISPLAY " "
       DISPLAY numberOfNickels_main
       DISPLAY (numberOfNickels_main == 1 ? " nickel" : " nickels")
       DISPLAY " "
       DISPLAY numberOfPennies_main
       DISPLAY (numberOfPennies_main == 1 ? " pennie" : " pennies")
       EXIT.


