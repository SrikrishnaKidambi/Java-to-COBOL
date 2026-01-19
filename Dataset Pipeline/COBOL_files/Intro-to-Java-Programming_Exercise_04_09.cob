       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_04_09.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_04_09_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_04_09_GLOBAL
       01  input_main      PIC X(100).
       01  s_main          PIC X(100).
       01  ch_main         PIC X(1).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
      * Prompt the user to enter a character
       DISPLAY "Enter a character: " WITH NO ADVANCING
       ACCEPT s_main
       MOVE FUNCTION CHAR(s_main.charAt(0)) TO ch_main
      * Display Unicode of character
       DISPLAY FUNCTION INTEGER(ch_main)
       EXIT.


