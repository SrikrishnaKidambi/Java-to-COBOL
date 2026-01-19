       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_04_20.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_04_20_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_04_20_GLOBAL
       01  input_main      PIC X(100).
       01  str_main        PIC X(100).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
      * Prompt the user to enter a string
       DISPLAY "Enter a sting: " WITH NO ADVANCING
       ACCEPT str_main
      * Display the string's length and its first character
       DISPLAY str_main
       DISPLAY " has a length of "
       DISPLAY str_main.length()
       DISPLAY " and its first character is "
       DISPLAY str_main.charAt(0)
       EXIT.


