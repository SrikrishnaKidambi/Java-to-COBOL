       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_03_24.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_03_24_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_03_24_GLOBAL
       01  rank_main       PIC S9(5).
       01  suit_main       PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Generate a random integer 1 - 13
       COMPUTE TEMP_0 = 14 - 1
       COMPUTE TEMP_1 = RANDOM * TEMP_0
       COMPUTE TEMP_2 = TEMP_1 + 1
       COMPUTE rank_main = TEMP_2
      * Generate a random integer 1 - 4
       COMPUTE TEMP_3 = RANDOM * 4
       COMPUTE suit_main = TEMP_3
      * Display card picked from deck
       DISPLAY "The card you picked is " WITH NO ADVANCING
       EVALUATE rank_main
       WHEN 1
       DISPLAY "Ace" WITH NO ADVANCING
       WHEN 2
       DISPLAY rank_main WITH NO ADVANCING
       WHEN 3
       DISPLAY rank_main WITH NO ADVANCING
       WHEN 4
       DISPLAY rank_main WITH NO ADVANCING
       WHEN 5
       DISPLAY rank_main WITH NO ADVANCING
       WHEN 6
       DISPLAY rank_main WITH NO ADVANCING
       WHEN 7
       DISPLAY rank_main WITH NO ADVANCING
       WHEN 8
       DISPLAY rank_main WITH NO ADVANCING
       WHEN 9
       DISPLAY rank_main WITH NO ADVANCING
       WHEN 10
       DISPLAY rank_main WITH NO ADVANCING
       WHEN 11
       DISPLAY "Jack" WITH NO ADVANCING
       WHEN 12
       DISPLAY "Queen" WITH NO ADVANCING
       WHEN 13
       DISPLAY "King" WITH NO ADVANCING
       END-EVALUATE
       DISPLAY " of " WITH NO ADVANCING
       EVALUATE suit_main
       WHEN 0
       DISPLAY "Clubs"
       WHEN 1
       DISPLAY "Diamonds"
       WHEN 2
       DISPLAY "Hearts"
       WHEN 3
       DISPLAY "Spades"
       END-EVALUATE
       EXIT.


