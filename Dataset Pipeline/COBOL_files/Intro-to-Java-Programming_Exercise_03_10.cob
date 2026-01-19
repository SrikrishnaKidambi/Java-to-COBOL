       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_03_10.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_03_10_GLOBAL
       01  AGRS_MAIN_-ARRAY.
           05  agrs_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_03_10_GLOBAL
       01  input_main      PIC X(100).
       01  number1_main    PIC S9(5).
       01  number2_main    PIC S9(5).
       01  answer_main     PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).
       01 TEMP_4 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
      * Generate tow integers less than 100
       COMPUTE TEMP_0 = RANDOM * 100
       COMPUTE number1_main = TEMP_0
       COMPUTE TEMP_1 = RANDOM * 100
       COMPUTE number2_main = TEMP_1
      * Prompt the user to enter an answer
       DISPLAY "What is " WITH NO ADVANCING
       DISPLAY number1_main WITH NO ADVANCING
       DISPLAY " WITH NO ADVANCING
       DISPLAY " WITH NO ADVANCING
       DISPLAY number2_main WITH NO ADVANCING
       DISPLAY "? " WITH NO ADVANCING
       ACCEPT answer_main
      * Display result
       ADD number1_main TO number2_main GIVING TEMP_2
       IF TEMP_2 = answer_main
       DISPLAY "You are correct!"
       ELSE
       DISPLAY "You are wrong "
       DISPLAY number1_main
       DISPLAY "
       DISPLAY "
       DISPLAY number2_main
       DISPLAY " should be "
       COMPUTE TEMP_4 = number1_main + number2_main
       COMPUTE TEMP_3 = TEMP_4
       DISPLAY TEMP_3
       END-IF
       EXIT.


