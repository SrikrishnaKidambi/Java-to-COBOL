       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_03_02.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_03_02_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_03_02_GLOBAL
       01  input_main      PIC X(100).
       01  digit1_main     PIC S9(5).
       01  digit2_main     PIC S9(5).
       01  digit3_main     PIC S9(5).
       01  answer_main     PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).
       01 TEMP_4 PIC S9(9).
       01 TEMP_5 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
      * Generate three random integers
       COMPUTE TEMP_0 = RANDOM * 10
       COMPUTE digit1_main = TEMP_0
       COMPUTE TEMP_1 = RANDOM * 10
       COMPUTE digit2_main = TEMP_1
       COMPUTE TEMP_2 = RANDOM * 10
       COMPUTE digit3_main = TEMP_2
      * Prompt user to enter the sum of three integers
       DISPLAY "What is " WITH NO ADVANCING
       DISPLAY digit1_main WITH NO ADVANCING
       DISPLAY " WITH NO ADVANCING
       DISPLAY " WITH NO ADVANCING
       DISPLAY digit2_main WITH NO ADVANCING
       DISPLAY " WITH NO ADVANCING
       DISPLAY " WITH NO ADVANCING
       DISPLAY digit3_main WITH NO ADVANCING
       DISPLAY "? " WITH NO ADVANCING
       ACCEPT answer_main
       DISPLAY digit1_main
       DISPLAY "
       DISPLAY "
       DISPLAY digit2_main
       DISPLAY "
       DISPLAY "
       DISPLAY digit3_main
       DISPLAY " = "
       DISPLAY answer_main
       DISPLAY " is "
       COMPUTE TEMP_4 = digit1_main + digit2_main
       COMPUTE TEMP_5 = digit3_main + answer_main
       COMPUTE TEMP_3 = TEMP_5
       DISPLAY TEMP_3
       EXIT.


