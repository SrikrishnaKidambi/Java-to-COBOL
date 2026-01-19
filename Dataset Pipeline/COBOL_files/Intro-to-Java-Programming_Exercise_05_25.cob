       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_05_25.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_05_25_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_25_GLOBAL
       01  sum_main        PIC S9(5)V9(2).
       01  value_main      PIC S9(5)V9(2).
       01  pi_main         PIC S9(5)V9(2).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_25_GLOBAL
       01  d_main          PIC S9(5)V9(2).
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
      * Compute PI value for i = 10000,
       MOVE 0 TO sum_main
       COMPUTE TEMP_0 = (2 * value_main - 1)
       PERFORM VARYING d_main FROM 1 BY 2 UNTIL NOT (d_main <= TEMP_0)
       COMPUTE TEMP_1 = 1 / d_main
       COMPUTE TEMP_2 = sum_main + TEMP_1
       COMPUTE sum_main = TEMP_2
       ADD d_main TO 2 GIVING d_main
       COMPUTE TEMP_3 = 1 / d_main
       COMPUTE TEMP_4 = sum_main - TEMP_3
       COMPUTE sum_main = TEMP_4
       COMPUTE TEMP_0 = (2 * value_main - 1)
       END-PERFORM
       MULTIPLY 4 BY sum_main GIVING pi_main
      * Display result
       DISPLAY "PI value for i = 10000: "
       DISPLAY pi_main
      * Compute PI value for i = 20000,
       MOVE 0 TO sum_main
       COMPUTE value_main = 0
       COMPUTE TEMP_5 = (2 * value_main - 1)
       PERFORM VARYING d_main FROM 1 BY 2 UNTIL NOT (d_main <= TEMP_5)
       COMPUTE TEMP_6 = 1 / d_main
       COMPUTE TEMP_7 = sum_main + TEMP_6
       COMPUTE sum_main = TEMP_7
       ADD d_main TO 2 GIVING d_main
       COMPUTE TEMP_8 = 1 / d_main
       COMPUTE TEMP_9 = sum_main - TEMP_8
       COMPUTE sum_main = TEMP_9
       COMPUTE TEMP_5 = (2 * value_main - 1)
       END-PERFORM
       MULTIPLY 4 BY sum_main GIVING pi_main
      * Display result
       DISPLAY "PI value for i = 20000: "
       DISPLAY pi_main
      * Compute PI value for i = 20000,
       MOVE 0 TO sum_main
       COMPUTE value_main = 0
       COMPUTE TEMP_10 = (2 * value_main - 1)
       PERFORM VARYING d_main FROM 1 BY 2 UNTIL NOT (d_main <= TEMP_10)
       COMPUTE TEMP_11 = 1 / d_main
       COMPUTE TEMP_12 = sum_main + TEMP_11
       COMPUTE sum_main = TEMP_12
       ADD d_main TO 2 GIVING d_main
       COMPUTE TEMP_13 = 1 / d_main
       COMPUTE TEMP_14 = sum_main - TEMP_13
       COMPUTE sum_main = TEMP_14
       COMPUTE TEMP_10 = (2 * value_main - 1)
       END-PERFORM
       MULTIPLY 4 BY sum_main GIVING pi_main
      * Display result
       DISPLAY "PI value for i = 100000: "
       DISPLAY pi_main
       EXIT.


