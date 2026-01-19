       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_04_13.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_04_13_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_04_13_GLOBAL
       01  input_main      PIC X(100).
       01  s_main          PIC X(100).
       01  ch_main         PIC X(1).


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
       IF Character.isLetter(ch_main)
       EVALUATE Character.toUpperCasech_main
       WHEN 'A'
       WHEN 'E'
       WHEN 'I'
       WHEN '0'
       WHEN 'U'
       DISPLAY ch_main
       DISPLAY " is a vowel"
       WHEN OTHER
       DISPLAY ch_main
       DISPLAY " is a consonant"
       END-EVALUATE
       ELSE
       DISPLAY ch_main
       DISPLAY " is an invalid input"
       END-IF
       EXIT.


