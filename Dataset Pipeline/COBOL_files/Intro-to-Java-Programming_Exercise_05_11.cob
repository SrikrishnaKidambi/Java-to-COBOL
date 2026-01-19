       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_05_11.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_05_11_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_11_GLOBAL
       01  NUMBERS_PER_LINE_main PIC S9(5).
       01  count_main      PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_11_GLOBAL
       01  i_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Number of numbers in each line displayed
      * Count the number divisible by 5 or 6, but not both
       MOVE 0 TO count_main
       PERFORM VARYING i_main FROM 100 BY 1 UNTIL NOT (i_main <= 200)
       DIVIDE i_main BY 5 GIVING TEMP_0 REMAINDER TEMP_0
       IF TEMP_0 = 0 ^ i_main % 6 = 0
       ADD 1 TO count_main
       DIVIDE count_main BY NUMBERS_PER_LINE_main GIVING TEMP_1 REMAINDER TEMP_1
       IF TEMP_1 = 0
       DISPLAY i_main
       ELSE
       DISPLAY i_main WITH NO ADVANCING
       DISPLAY " " WITH NO ADVANCING
       END-IF
       END-IF
       END-PERFORM
       EXIT.


