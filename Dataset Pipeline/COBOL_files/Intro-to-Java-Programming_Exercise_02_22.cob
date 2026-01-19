       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_02_22.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_02_22_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_02_22_GLOBAL
       01  input_main      PIC X(100).
       01  amount_main     PIC S9(5).
       01  remainingAmount_main PIC S9(5).
       01  numberOfOneDollars_main PIC S9(5).
       01  numberOfQuarters_main PIC S9(5).
       01  numberOfDimes_main PIC S9(5).
       01  numberOfNickels_main PIC S9(5).
       01  numberOfPennies_main PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
      * Receive the amount
       DISPLAY "Enter an amount as integer, for example 1156 for 11.56: " WITH NO ADVANCING
       ACCEPT amount_main
       MOVE amount_main TO remainingAmount_main
      * Find the number of one dollars
       DIVIDE remainingAmount_main BY 100 GIVING numberOfOneDollars_main
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
      * Find the number of pennies in the remaining amoung
       MOVE remainingAmount_main TO numberOfPennies_main
      * Display results
       DISPLAY "Your amount "
       COMPUTE TEMP_1 = 100 / 0
       COMPUTE TEMP_0 = TEMP_1
       DISPLAY TEMP_0
       DISPLAY " consists of"
       DISPLAY " "
       DISPLAY numberOfOneDollars_main
       DISPLAY " dollars"
       DISPLAY " "
       DISPLAY numberOfQuarters_main
       DISPLAY " quarters"
       DISPLAY " "
       DISPLAY numberOfDimes_main
       DISPLAY " dimes"
       DISPLAY " "
       DISPLAY numberOfNickels_main
       DISPLAY " nickels"
       DISPLAY " "
       DISPLAY numberOfPennies_main
       DISPLAY " pennies"
       EXIT.


