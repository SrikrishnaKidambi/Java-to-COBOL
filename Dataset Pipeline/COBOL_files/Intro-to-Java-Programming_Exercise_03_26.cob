       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_03_26.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_03_26_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_03_26_GLOBAL
       01  input_main      PIC X(100).
       01  number_main     PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).
       01 TEMP_4 PIC S9(9).
       01 TEMP_5 PIC S9(9).
       01 TEMP_6 PIC S9(9).
       01 TEMP_7 PIC S9(9).
       01 TEMP_8 PIC S9(9).
       01 TEMP_9 PIC S9(9).
       01 TEMP_10 PIC S9(9).
       01 TEMP_11 PIC S9(9).
       01 TEMP_12 PIC S9(9).
       01 TEMP_13 PIC S9(9).
       01 TEMP_14 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Create Scanner object
      * Input from ODT is enabled
      * Prompt user to an integer
       DISPLAY "Enter an integer: " WITH NO ADVANCING
       ACCEPT number_main
      * Determine whether it is divisible by 5 and 6
      * Display results
       DISPLAY "Is 10 divisible by 5 and 6? "
       DIVIDE 5 BY 0 GIVING TEMP_1 REMAINDER TEMP_2
       DIVIDE 6 BY 0 GIVING TEMP_3 REMAINDER TEMP_4
       COMPUTE TEMP_0 = TEMP_4
       DISPLAY TEMP_0
       DISPLAY "Is 10 divisible by 5 or 6? "
       DIVIDE 5 BY 0 GIVING TEMP_6 REMAINDER TEMP_7
       DIVIDE 6 BY 0 GIVING TEMP_8 REMAINDER TEMP_9
       COMPUTE TEMP_5 = TEMP_9
       DISPLAY TEMP_5
       DISPLAY "Is 10 divisible by 5 of 6, but not both? "
       DIVIDE 5 BY 0 GIVING TEMP_11 REMAINDER TEMP_12
       DIVIDE 6 BY 0 GIVING TEMP_13 REMAINDER TEMP_14
       COMPUTE TEMP_10 = TEMP_14
       DISPLAY TEMP_10
       EXIT.


