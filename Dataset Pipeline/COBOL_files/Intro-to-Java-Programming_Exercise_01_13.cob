       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_01_13.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_01_13_GLOBAL
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


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       DISPLAY "3.4x
       DISPLAY 50.2y = 44.5"
       DISPLAY "2.1x
       DISPLAY .55y =  5.9"
       DISPLAY "x = (44.5 * .55) - (50.2 * 5.9)"
       DISPLAY "    ----------------------------"
       DISPLAY "    (3.4  * .55) - (50.2 * 2.1)"
       COMPUTE TEMP_1 = 5 * 55
       COMPUTE TEMP_2 = 5 * 9
       COMPUTE TEMP_3 = 2 - TEMP_2
       COMPUTE TEMP_4 = 4 * 55
       COMPUTE TEMP_5 = 2 * 1
       COMPUTE TEMP_6 = 2 - TEMP_5
       COMPUTE TEMP_7 = 50 / TEMP_6
       COMPUTE TEMP_0 = TEMP_7
       DISPLAY TEMP_0
       DISPLAY " "
       DISPLAY "y = (3.4 * 5.9) - (44.5 * 2.1)"
       DISPLAY "    --------------------------"
       DISPLAY "    (3.4 * .55) - (50.2 * 2.1)"
       COMPUTE TEMP_9 = 5 * 9
       COMPUTE TEMP_10 = 2 * 1
       COMPUTE TEMP_11 = 5 - TEMP_10
       COMPUTE TEMP_12 = 4 * 55
       COMPUTE TEMP_13 = 2 * 1
       COMPUTE TEMP_14 = 2 - TEMP_13
       COMPUTE TEMP_15 = 50 / TEMP_14
       COMPUTE TEMP_8 = TEMP_15
       DISPLAY TEMP_8
       EXIT.


