       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_03_09.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_03_09_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_03_09_GLOBAL
       01  input_main      PIC X(100).
       01  isbn_main       PIC S9(5).
       01  d1_main         PIC S9(5).
       01  remainingDigits_main PIC S9(5).
       01  d2_main         PIC S9(5).
       01  d3_main         PIC S9(5).
       01  d4_main         PIC S9(5).
       01  d5_main         PIC S9(5).
       01  d6_main         PIC S9(5).
       01  d7_main         PIC S9(5).
       01  d8_main         PIC S9(5).
       01  d9_main         PIC S9(5).
       01  d10_main        PIC S9(5).
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
       01 TEMP_15 PIC S9(9).
       01 TEMP_16 PIC S9(9).
       01 TEMP_17 PIC S9(9).
       01 TEMP_18 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
      * Prompt the user to enter the first 9 digits of a 10-digit ISBN
       DISPLAY "Enter the first 9 digits of an ISBN as integer: " WITH NO ADVANCING
       ACCEPT isbn_main
      * Extract the digits of the ISBN
       DIVIDE isbn_main BY 100000000 GIVING d1_main
       DIVIDE isbn_main BY 100000000 GIVING remainingDigits_main REMAINDER remainingDigits_main
       DIVIDE remainingDigits_main BY 10000000 GIVING d2_main
       DIVIDE remainingDigits_main BY 10000000 GIVING remainingDigits_main REMAINDER remainingDigits_main
       DIVIDE remainingDigits_main BY 1000000 GIVING d3_main
       DIVIDE remainingDigits_main BY 1000000 GIVING remainingDigits_main REMAINDER remainingDigits_main
       DIVIDE remainingDigits_main BY 100000 GIVING d4_main
       DIVIDE remainingDigits_main BY 100000 GIVING remainingDigits_main REMAINDER remainingDigits_main
       DIVIDE remainingDigits_main BY 10000 GIVING d5_main
       DIVIDE remainingDigits_main BY 10000 GIVING remainingDigits_main REMAINDER remainingDigits_main
       DIVIDE remainingDigits_main BY 1000 GIVING d6_main
       DIVIDE remainingDigits_main BY 1000 GIVING remainingDigits_main REMAINDER remainingDigits_main
       DIVIDE remainingDigits_main BY 100 GIVING d7_main
       DIVIDE remainingDigits_main BY 100 GIVING remainingDigits_main REMAINDER remainingDigits_main
       DIVIDE remainingDigits_main BY 10 GIVING d8_main
       DIVIDE remainingDigits_main BY 10 GIVING remainingDigits_main REMAINDER remainingDigits_main
       MOVE remainingDigits_main TO d9_main
      * Compute d10
       COMPUTE TEMP_0 = d1_main * 1
       COMPUTE TEMP_1 = d2_main * 2
       COMPUTE TEMP_2 = TEMP_0 + TEMP_1
       COMPUTE TEMP_3 = d3_main * 3
       COMPUTE TEMP_4 = TEMP_2 + TEMP_3
       COMPUTE TEMP_5 = d4_main * 4
       COMPUTE TEMP_6 = TEMP_4 + TEMP_5
       COMPUTE TEMP_7 = d5_main * 5
       COMPUTE TEMP_8 = TEMP_6 + TEMP_7
       COMPUTE TEMP_9 = d6_main * 6
       COMPUTE TEMP_10 = TEMP_8 + TEMP_9
       COMPUTE TEMP_11 = d7_main * 7
       COMPUTE TEMP_12 = TEMP_10 + TEMP_11
       COMPUTE TEMP_13 = d8_main * 8
       COMPUTE TEMP_14 = TEMP_12 + TEMP_13
       COMPUTE TEMP_15 = d9_main * 9
       COMPUTE TEMP_16 = TEMP_14 + TEMP_15
       DIVIDE TEMP_16 BY 11 GIVING TEMP_17 REMAINDER TEMP_18
       COMPUTE d10_main = TEMP_18
      * Display the 10-digit ISBN
       DISPLAY "The ISBN-10 number is "
       DISPLAY d1_main
       DISPLAY d2_main
       DISPLAY d3_main
       DISPLAY d4_main
       DISPLAY d5_main
       DISPLAY d6_main
       DISPLAY d7_main
       DISPLAY d8_main
       DISPLAY d9_main
       IF d10_main = 10
       DISPLAY "X"
       ELSE
       DISPLAY d10_main
       END-IF
       EXIT.


