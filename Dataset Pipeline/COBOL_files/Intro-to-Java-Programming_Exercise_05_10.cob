       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_05_10.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_05_10_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_10_GLOBAL
       01  NUMBERS_PER_LINE_main PIC S9(5).
       01  count_main      PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_10_GLOBAL
       01  i_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Display 10 numbers per line
      * Count the number of numbers divisible by 5 and 6
       MOVE 0 TO count_main
      * Test all numbers from 100 to 1,000
       PERFORM VARYING i_main FROM 100 BY 1 UNTIL NOT (i_main <= 1000)
      * Test if number is divisible by 5 and 6
       DIVIDE i_main BY 5 GIVING TEMP_0 REMAINDER TEMP_0
       DIVIDE i_main BY 6 GIVING TEMP_1 REMAINDER TEMP_1
       IF TEMP_0 = 0  AND  TEMP_1 = 0
      * increment count
       ADD 1 TO count_main
      * Test if numbers per line is 10
       DIVIDE count_main BY NUMBERS_PER_LINE_main GIVING TEMP_2 REMAINDER TEMP_2
       IF TEMP_2 = 0
       DISPLAY i_main
       ELSE
       DISPLAY i_main WITH NO ADVANCING
       DISPLAY " " WITH NO ADVANCING
       END-IF
       END-IF
       END-PERFORM
       EXIT.


