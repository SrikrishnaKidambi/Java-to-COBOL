       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_04_19.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_04_19_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_04_19_GLOBAL
       01  input_main      PIC X(100).
       01  isbn_main       PIC X(100).
       01  d1_main         PIC S9(5).
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
      * Prompt the user to enter the first 9 digits
       DISPLAY "Enter the first 9 digits of a ISBN: " WITH NO ADVANCING
       ACCEPT isbn_main
      * Extract the digits of the ISBN
       COMPUTE d1_main = 1
       COMPUTE d2_main = 2
       COMPUTE d3_main = 3
       COMPUTE d4_main = 4
       COMPUTE d5_main = 5
       COMPUTE d6_main = 6
       COMPUTE d7_main = 7
       COMPUTE d8_main = 8
       COMPUTE d9_main = 8
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
       DISPLAY isbn_main
       DISPLAY ((d10_main == 10) ? "X" : d10_main)
       EXIT.


