       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_03_15.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_03_15_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_03_15_GLOBAL
       01  input_main      PIC X(100).
       01  lottery_main    PIC S9(5).
       01  guess_main      PIC S9(5).
       01  lotteryDigit1_main PIC S9(5).
       01  remainingDigits_main PIC S9(5).
       01  lotteryDigit2_main PIC S9(5).
       01  lotteryDigit3_main PIC S9(5).
       01  guessDigit1_main PIC S9(5).
       01  guessDigit2_main PIC S9(5).
       01  guessDigit3_main PIC S9(5).
       01 TEMP_0 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
      * Generate a random three-digit number
       COMPUTE TEMP_0 = RANDOM * 1000
       COMPUTE lottery_main = TEMP_0
      * Prompt the user to enter a three-digit number
       DISPLAY "Enter a three-digit number: " WITH NO ADVANCING
       ACCEPT guess_main
      * Extract digits from lottery
       DIVIDE lottery_main BY 100 GIVING lotteryDigit1_main
       DIVIDE lottery_main BY 100 GIVING remainingDigits_main REMAINDER remainingDigits_main
       DIVIDE remainingDigits_main BY 10 GIVING lotteryDigit2_main
       DIVIDE remainingDigits_main BY 10 GIVING lotteryDigit3_main REMAINDER lotteryDigit3_main
      * Extract digits from guess
       DIVIDE guess_main BY 100 GIVING guessDigit1_main
       DIVIDE guess_main BY 100 GIVING remainingDigits_main REMAINDER remainingDigits_main
       DIVIDE remainingDigits_main BY 10 GIVING guessDigit2_main
       DIVIDE remainingDigits_main BY 10 GIVING guessDigit3_main REMAINDER guessDigit3_main
       DISPLAY "The lottery number is "
       DISPLAY lottery_main
      * Check the guess
       IF guess_main = lottery_main
       DISPLAY "Exact match: you win $10,000"
       END-IF
       IF guessDigit1_main = lotteryDigit2_main
       END-IF
       EXIT.


