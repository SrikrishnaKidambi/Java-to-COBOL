       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_05_34.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_05_34_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_34_GLOBAL
       01  input_main      PIC X(100).
       01  computerWins_main PIC S9(5).
       01  userWins_main   PIC S9(5).
      * Variables for Scope:BLOCK_BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_34_GLOBAL
       01  computer_main   PIC S9(5).
       01  user_main       PIC S9(5).
      * Variables for Scope:BLOCK_IF_BLOCK_BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_34_GLOBAL
       01  win_main        PIC X(1).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
      * Set acummulators to 0
       COMPUTE computerWins_main = 0
       PERFORM WITH TEST AFTER
      * Generate a random integer 0, 1, or 2
       COMPUTE TEMP_1 = RANDOM * 3
       COMPUTE computer_main = TEMP_1
      * Prompt the user to enter a number 0, 1, or 2
       DISPLAY "scissor (0), rock(1), paper (2): " WITH NO ADVANCING
       ACCEPT user_main
       DISPLAY "The computer is " WITH NO ADVANCING
       EVALUATE computer_main
       WHEN 0
       DISPLAY "scissor." WITH NO ADVANCING
       WHEN 1
       DISPLAY "rock." WITH NO ADVANCING
       WHEN 2
       DISPLAY "paper." WITH NO ADVANCING
       END-EVALUATE
       DISPLAY " You are " WITH NO ADVANCING
       EVALUATE user_main
       WHEN 0
       DISPLAY "scissor" WITH NO ADVANCING
       WHEN 1
       DISPLAY "rock" WITH NO ADVANCING
       WHEN 2
       DISPLAY "paper" WITH NO ADVANCING
       WHEN OTHER
       DISPLAY "disqualified for entering an invalid number."
       STOP RUN
       END-EVALUATE
      * Display result
       IF computer_main = user_main
       DISPLAY " too, It is a draw"
       ELSE
       IF win_main
       DISPLAY ". You won"
      * Increment computer wins
       ADD 1 TO computerWins_main
       ELSE
       DISPLAY ". You lose"
      * Increment user wins
       ADD 1 TO userWins_main
       END-IF
       END-IF
      * Print Score
       DISPLAY "Computer wins: "
       DISPLAY computerWins_main
       DISPLAY "\nUser wins: "
       DISPLAY userWins_main
       COMPUTE TEMP_0 = Math.abs(computerWins_main - userWins_main)
       END-PERFORM UNTIL NOT (TEMP_0 <= 2)
       EXIT.


