       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_05_23.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_05_23_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_23_GLOBAL
       01  sumLeftToRight_main PIC S9(5)V9(2).
       01  sumRightToLeft_main PIC S9(5)V9(2).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_23_GLOBAL
       01  i_main          PIC S9(5)V9(2).
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
      * Compute series from left to right
       PERFORM VARYING i_main FROM 1 BY 1 UNTIL NOT (i_main <= 50000.0)
       COMPUTE TEMP_0 = 1 / i_main
       COMPUTE TEMP_1 = sumLeftToRight_main + TEMP_0
       COMPUTE sumLeftToRight_main = TEMP_1
       END-PERFORM
      * Display result of series sum from left to right
       DISPLAY "Summation of series left to right: "
       DISPLAY sumLeftToRight_main
      * Compute series from right to left
       PERFORM VARYING i_main FROM 50000 BY -1 UNTIL NOT (i_main >= 1.0)
       COMPUTE TEMP_2 = 1 / i_main
       COMPUTE TEMP_3 = sumRightToLeft_main + TEMP_2
       COMPUTE sumRightToLeft_main = TEMP_3
       END-PERFORM
      * Display result of series sum from right to left
       DISPLAY "Summation of series right to left: "
       DISPLAY sumRightToLeft_main
      * Compare the results
       DISPLAY "Summation of the series right to left - "
       DISPLAY "Summation of the series left to right: "
       COMPUTE TEMP_5 = sumRightToLeft_main - sumLeftToRight_main
       COMPUTE TEMP_4 = TEMP_5
       DISPLAY TEMP_4
       EXIT.


