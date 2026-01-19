       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_05_35.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_05_35_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_35_GLOBAL
       01  summation_main  PIC S9(5)V9(2).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_35_GLOBAL
       01  i_main          PIC S9(5)V9(2).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       PERFORM VARYING i_main FROM 1 BY 1 UNTIL NOT (i_main <= 624.0)
       COMPUTE TEMP_0 = i_main + 1
       COMPUTE TEMP_1 = SQRT + TEMP_0
       COMPUTE TEMP_2 = FUNCTION / TEMP_1
       COMPUTE TEMP_3 = i_main + TEMP_2
       COMPUTE summation_main = TEMP_3
       END-PERFORM
       DISPLAY "Summation: "
       DISPLAY summation_main
       EXIT.


