       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_05_17.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_05_17_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_17_GLOBAL
       01  input_main      PIC X(100).
       01  numberOfLines_main PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_17_GLOBAL
       01  rows_main       PIC S9(5).
      * Variables for Scope:FOR_BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_17_GLOBAL
       01  s_main          PIC S9(5).
       01  l_main          PIC S9(5).
       01  r_main          PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Create a Scanner object
      * Input from ODT is enabled
      * Prompt the user to enter an integer from 1 to 15
       DISPLAY "Enter the number of lines: " WITH NO ADVANCING
       ACCEPT numberOfLines_main
      * Display pyramid
       PERFORM VARYING rows_main FROM 1 BY 1 UNTIL NOT (rows_main <= numberOfLines_main)
      * Create spaces in each row
       PERFORM VARYING s_main FROM numberOfLines_main BY -1 UNTIL NOT (s_main >= 1)
       SUBTRACT rows_main FROM numberOfLines_main GIVING s_main
       DISPLAY "  " WITH NO ADVANCING
       END-PERFORM
      * Create decending numbers in each row
       PERFORM VARYING l_main FROM rows_main BY -1 UNTIL NOT (l_main >= 2)
       DISPLAY l_main WITH NO ADVANCING
       DISPLAY " " WITH NO ADVANCING
       END-PERFORM
      * Create ascending number in each row
       PERFORM VARYING r_main FROM 1 BY 1 UNTIL NOT (r_main <= rows_main)
       DISPLAY r_main WITH NO ADVANCING
       DISPLAY " " WITH NO ADVANCING
       END-PERFORM
      * End line
       END-PERFORM
       EXIT.


