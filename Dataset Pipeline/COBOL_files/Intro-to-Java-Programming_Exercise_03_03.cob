       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_03_03.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_03_03_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_03_03_GLOBAL
       01  input_main      PIC X(100).
       01  a_main          PIC S9(5)V9(2).
       01  b_main          PIC S9(5)V9(2).
       01  c_main          PIC S9(5)V9(2).
       01  d_main          PIC S9(5)V9(2).
       01  e_main          PIC S9(5)V9(2).
       01  f_main          PIC S9(5)V9(2).
      * Variables for Scope:BLOCK_IF_BLOCK_METHOD_MAIN_CLASS_EXERCISE_03_03_GLOBAL
       01  x_main          PIC S9(5)V9(2).
       01  y_main          PIC S9(5)V9(2).
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


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
      * Prompt the user to enter a, b, c, d, e, and f.
       DISPLAY "Enter a, b, c, d, e, f: " WITH NO ADVANCING
       ACCEPT a_main
       ACCEPT b_main
       ACCEPT c_main
       ACCEPT d_main
       ACCEPT e_main
       ACCEPT f_main
      * Solve the linear equation
       COMPUTE TEMP_1 = a_main * d_main
       COMPUTE TEMP_2 = b_main * c_main
       COMPUTE TEMP_3 = TEMP_1 - TEMP_2
       COMPUTE TEMP_0 = TEMP_3
       IF TEMP_0 = 0
       DISPLAY "The equation has no solution."
       ELSE
       COMPUTE TEMP_4 = e_main * d_main
       COMPUTE TEMP_5 = b_main * f_main
       COMPUTE TEMP_6 = TEMP_4 - TEMP_5
       COMPUTE TEMP_7 = a_main * d_main
       COMPUTE TEMP_8 = b_main * c_main
       COMPUTE TEMP_9 = TEMP_7 - TEMP_8
       COMPUTE TEMP_10 = TEMP_6 / TEMP_9
       COMPUTE x_main = TEMP_10
       COMPUTE TEMP_11 = a_main * f_main
       COMPUTE TEMP_12 = e_main * c_main
       COMPUTE TEMP_13 = TEMP_11 - TEMP_12
       COMPUTE TEMP_14 = a_main * d_main
       COMPUTE TEMP_15 = b_main * c_main
       COMPUTE TEMP_16 = TEMP_14 - TEMP_15
       COMPUTE TEMP_17 = TEMP_13 / TEMP_16
       COMPUTE y_main = TEMP_17
       DISPLAY "x is "
       DISPLAY x_main
       DISPLAY " and y is "
       DISPLAY y_main
       END-IF
       EXIT.


