       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_05_50.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_05_50_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_50_GLOBAL
       01  input_main      PIC X(100).
       01  string_main     PIC X(100).
       01  count_main      PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_50_GLOBAL
       01  i_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
      * Prompt the user to enter a string
       DISPLAY "Enter a string: " WITH NO ADVANCING
       ACCEPT string_main
      * Count the number of uppercase letters
       MOVE 0 TO count_main
       COMPUTE TEMP_0 = string_main.length()
       PERFORM VARYING i_main FROM 0 BY 1 UNTIL NOT (i_main < TEMP_0)
       IF Character.isUpperCase(string_main.charAt(i_main))
       ADD 1 TO count_main
       END-IF
       COMPUTE TEMP_0 = string_main.length()
       END-PERFORM
      * Display the results
       DISPLAY "Tne number of uppercase letters is "
       DISPLAY count_main
       EXIT.


