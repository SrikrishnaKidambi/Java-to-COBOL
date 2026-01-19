       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_04_14.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_04_14_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_04_14_GLOBAL
       01  input_main      PIC X(100).
       01  s_main          PIC X(100).
       01  ch_main         PIC X(1).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
      * Prompt the user to enter a letter grade A, B, C, D or F
       DISPLAY "Enter a letter grade: " WITH NO ADVANCING
       ACCEPT s_main
       MOVE FUNCTION CHAR(s_main.charAt(0)) TO ch_main
       MOVE FUNCTION CHAR(Character.toUpperCase(FUNCTION ORD(ch_main))) TO ch_main
       IF ch_main >= 'A'  AND  ch_main <= 'F'  AND  ch_main != 'E'
       DISPLAY "The numeric value for grade " WITH NO ADVANCING
       DISPLAY ch_main WITH NO ADVANCING
       DISPLAY " is " WITH NO ADVANCING
       EVALUATE ch_main
       WHEN 'A'
       DISPLAY 4
       WHEN 'B'
       DISPLAY 3
       WHEN 'C'
       DISPLAY 2
       WHEN 'D'
       DISPLAY 1
       WHEN 'F'
       DISPLAY 0
       END-EVALUATE
       ELSE
       DISPLAY ch_main
       DISPLAY " is an invalid grade"
       END-IF
       EXIT.


