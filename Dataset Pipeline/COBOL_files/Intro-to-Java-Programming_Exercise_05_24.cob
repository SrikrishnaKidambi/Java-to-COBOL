       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_05_24.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_05_24_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_24_GLOBAL
       01  sum_main        PIC S9(5)V9(2).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_24_GLOBAL
       01  n_main          PIC S9(5)V9(2).
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


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Sum the series
       PERFORM VARYING n_main FROM 1 BY 2 UNTIL NOT (n_main <= 97.0)
       COMPUTE TEMP_0 = n_main + 2
       COMPUTE TEMP_1 = n_main / TEMP_0
       COMPUTE TEMP_2 = sum_main + TEMP_1
       COMPUTE sum_main = TEMP_2
       END-PERFORM
       COMPUTE TEMP_4 = 1 / 3
       COMPUTE TEMP_3 = TEMP_4
       DISPLAY TEMP_3
       DIVIDE 3 BY 5 GIVING TEMP_5
       DISPLAY TEMP_5
       DIVIDE 5 BY 7 GIVING TEMP_6
       DISPLAY TEMP_6
       DIVIDE 7 BY 9 GIVING TEMP_7
       DISPLAY TEMP_7
       DIVIDE 9 BY 11 GIVING TEMP_8
       DISPLAY TEMP_8
       DIVIDE 11 BY 13 GIVING TEMP_9
       DISPLAY TEMP_9
       DISPLAY "
       DISPLAY " ...
       DIVIDE 95 BY 97 GIVING TEMP_10
       DISPLAY TEMP_10
       COMPUTE TEMP_12 = 97 / 99
       COMPUTE TEMP_11 = TEMP_12
       DISPLAY TEMP_11
       DISPLAY "Sum of series: "
       DISPLAY sum_main
       EXIT.


