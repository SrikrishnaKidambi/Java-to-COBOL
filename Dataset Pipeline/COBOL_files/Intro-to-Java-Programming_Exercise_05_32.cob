       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_05_32.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_05_32_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_32_GLOBAL
       01  lotteryDigit1_main PIC S9(5).
       01  lotteryDigit2_main PIC S9(5).
       01  guess_main      PIC S9(5).
       01  guessDigit1_main PIC S9(5).
       01  guessDigit2_main PIC S9(5).
       01  input_main      PIC X(100).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Generate a lottery number
       COMPUTE TEMP_0 = RANDOM * 10
       COMPUTE lotteryDigit1_main = TEMP_0
       PERFORM WITH TEST AFTER
       COMPUTE TEMP_1 = RANDOM * 10
       COMPUTE lotteryDigit2_main = TEMP_1
       END-PERFORM UNTIL NOT (lotteryDigit1_main = lotteryDigit2_main)
      * Prompt the user to enter a guess
      * Input from ODT is enabled
       DISPLAY "Enter your lottery pick (two distinct digits): " WITH NO ADVANCING
       ACCEPT guess_main
      * Get digits from guess
       DIVIDE guess_main BY 10 GIVING guessDigit1_main
       DIVIDE guess_main BY 10 GIVING guessDigit2_main REMAINDER guessDigit2_main
       DISPLAY "The lottery number is "
       DISPLAY lotteryDigit1_main
       DISPLAY lotteryDigit2_main
      * Check the guess
       IF guessDigit1_main = lotteryDigit1_main  AND  guessDigit2_main = lotteryDigit2_main
       DISPLAY "Exact match: you win $10,000"
       ELSE
       IF guessDigit2_main = lotteryDigit1_main  AND  guessDigit1_main = lotteryDigit2_main
       DISPLAY "Match all digits: you win $3,000"
       ELSE
       IF guessDigit1_main = lotteryDigit1_main  OR  guessDigit1_main = lotteryDigit2_main  OR  guessDigit2_main = lotteryDigit1_main  OR  guessDigit2_main = lotteryDigit2_main
       DISPLAY "Match one digit: you win $1,000"
       ELSE
       DISPLAY "Sorry, no match"
       END-IF
       END-IF
       END-IF
       EXIT.


