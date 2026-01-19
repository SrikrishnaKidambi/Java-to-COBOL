       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_04_15.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_04_15_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_04_15_GLOBAL
       01  input_main      PIC X(100).
       01  s_main          PIC X(100).
       01  ch_main         PIC X(1).
       01  number_main     PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
      * Prompt the user to enter a letter
       DISPLAY "Enter a letter: " WITH NO ADVANCING
       ACCEPT s_main
       MOVE FUNCTION CHAR(s_main.charAt(0)) TO ch_main
       MOVE FUNCTION CHAR(Character.toUpperCase(FUNCTION ORD(ch_main))) TO ch_main
      * Display its corresponding number
       MOVE 0 TO number_main
       IF Character.isLetter(ch_main)
       IF ch_main >= 'W'
       MOVE 9 TO number_main
       ELSE
       IF ch_main >= 'T'
       MOVE 8 TO number_main
       ELSE
       IF ch_main >= 'P'
       MOVE 7 TO number_main
       ELSE
       IF ch_main >= 'M'
       MOVE 6 TO number_main
       ELSE
       IF ch_main >= 'J'
       MOVE 5 TO number_main
       ELSE
       IF ch_main >= 'G'
       MOVE 4 TO number_main
       ELSE
       IF ch_main >= 'D'
       MOVE 3 TO number_main
       ELSE
       IF ch_main >= 'A'
       MOVE 2 TO number_main
       END-IF
       END-IF
       END-IF
       END-IF
       END-IF
       END-IF
       END-IF
       END-IF
       DISPLAY "The corresponding number is "
       DISPLAY number_main
       ELSE
       DISPLAY ch_main
       DISPLAY " is an invalid input"
       END-IF
       EXIT.


