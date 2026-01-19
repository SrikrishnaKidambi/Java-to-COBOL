       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_04_26.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_04_26_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_04_26_GLOBAL
       01  input_main      PIC X(100).
       01  amount_main     PIC X(100).
       01  numberOfOneDollars_main PIC X(100).
       01  cents_main      PIC S9(5).
       01  numberOfQuarters_main PIC S9(5).
       01  numberOfDimes_main PIC S9(5).
       01  numberOfNickels_main PIC S9(5).
       01 TEMP_0 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Create a Scanner
      * Input from ODT is enabled
      * Receive the amount
       DISPLAY "Enter an amount, for example 11.56: " WITH NO ADVANCING
       ACCEPT amount_main
      * Extract number of dollars
      * Extract cents
       COMPUTE TEMP_0 = ORD + 1
       COMPUTE cents_main = TEMP_0
      * Find the number of quarters
       DIVIDE cents_main BY 25 GIVING numberOfQuarters_main
       DIVIDE cents_main BY 25 GIVING cents_main REMAINDER cents_main
      * Find the number of dimes
       DIVIDE cents_main BY 10 GIVING numberOfDimes_main
       DIVIDE cents_main BY 10 GIVING cents_main REMAINDER cents_main
      * Find the number of nickels
       DIVIDE cents_main BY 5 GIVING numberOfNickels_main
       DIVIDE cents_main BY 5 GIVING cents_main REMAINDER cents_main
      * Display results
       DISPLAY "Your amount "
       DISPLAY amount_main
       DISPLAY " consists of\n "
       DISPLAY numberOfOneDollars_main
       DISPLAY " dollars\n "
       DISPLAY numberOfQuarters_main
       DISPLAY " quarters\n "
       DISPLAY numberOfDimes_main
       DISPLAY " dimes\n "
       DISPLAY numberOfNickels_main
       DISPLAY " nickels\n "
       DISPLAY cents_main
       DISPLAY " pennies\n "
       EXIT.


