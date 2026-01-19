       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_04_22.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_04_22_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_04_22_GLOBAL
       01  input_main      PIC X(100).
       01  string1_main    PIC X(100).
       01  string2_main    PIC X(100).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
      * Prompt the user to enter two strings
       DISPLAY "Enter string s1: " WITH NO ADVANCING
       ACCEPT string1_main
       DISPLAY "Enter string s2: " WITH NO ADVANCING
       ACCEPT string2_main
      * Display wheater the second string
      * is a substring of the frist string
       DISPLAY string2_main
       DISPLAY ((string1_main.contains(string2_main)) ? " is " : " is not ")
       DISPLAY "a substring of "
       DISPLAY string1_main
       EXIT.


