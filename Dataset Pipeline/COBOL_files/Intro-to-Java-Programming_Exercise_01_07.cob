       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_01_07.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_01_07_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
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
       01 TEMP_19 PIC S9(9).
       01 TEMP_20 PIC S9(9).
       01 TEMP_21 PIC S9(9).
       01 TEMP_22 PIC S9(9).
       01 TEMP_23 PIC S9(9).
       01 TEMP_24 PIC S9(9).
       01 TEMP_25 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       COMPUTE TEMP_1 = 1 / 3
       COMPUTE TEMP_2 = 0 - TEMP_1
       COMPUTE TEMP_3 = 1 / 5
       COMPUTE TEMP_4 = TEMP_2 + TEMP_3
       COMPUTE TEMP_5 = 1 / 7
       COMPUTE TEMP_6 = TEMP_4 - TEMP_5
       COMPUTE TEMP_7 = 1 / 9
       COMPUTE TEMP_8 = TEMP_6 + TEMP_7
       COMPUTE TEMP_9 = 1 / 11
       COMPUTE TEMP_10 = TEMP_8 - TEMP_9
       COMPUTE TEMP_11 = 1 * TEMP_10
       COMPUTE TEMP_0 = TEMP_11
       DISPLAY TEMP_0
       COMPUTE TEMP_13 = 1 / 3
       COMPUTE TEMP_14 = 0 - TEMP_13
       COMPUTE TEMP_15 = 1 / 5
       COMPUTE TEMP_16 = TEMP_14 + TEMP_15
       COMPUTE TEMP_17 = 1 / 7
       COMPUTE TEMP_18 = TEMP_16 - TEMP_17
       COMPUTE TEMP_19 = 1 / 9
       COMPUTE TEMP_20 = TEMP_18 + TEMP_19
       COMPUTE TEMP_21 = 1 / 11
       COMPUTE TEMP_22 = TEMP_20 - TEMP_21
       COMPUTE TEMP_23 = 1 / 13
       COMPUTE TEMP_24 = TEMP_22 + TEMP_23
       COMPUTE TEMP_25 = 1 * TEMP_24
       COMPUTE TEMP_12 = TEMP_25
       DISPLAY TEMP_12
       EXIT.


