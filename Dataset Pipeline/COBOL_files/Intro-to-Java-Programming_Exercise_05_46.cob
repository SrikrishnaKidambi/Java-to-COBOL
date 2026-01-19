       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_05_46.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_05_46_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_46_GLOBAL
       01  input_main      PIC X(100).
       01  string_main     PIC X(100).
       01  reverse_main    PIC X(100).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_46_GLOBAL
       01  i_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
      * Prompt the user to enter a string
       DISPLAY "Enter a string: " WITH NO ADVANCING
       ACCEPT string_main
      * Reverse the string
       MOVE "" TO reverse_main
       PERFORM VARYING i_main FROM string_main BY -1 UNTIL NOT (i_main >= 0)
       COMPUTE TEMP_0 = length - 1
       COMPUTE i_main = TEMP_0
       COMPUTE TEMP_1 = charAt + i_main
       COMPUTE reverse_main = TEMP_1
       END-PERFORM
      * Display the string in reverse order
       DISPLAY "The reversed string is "
       DISPLAY reverse_main
       EXIT.


