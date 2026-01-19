       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_01_09.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_01_09_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).
       01 TEMP_4 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       DISPLAY "Area = "
       COMPUTE TEMP_1 = 7 * 9
       COMPUTE TEMP_0 = TEMP_1
       DISPLAY TEMP_0
       DISPLAY "Perimeter = "
       COMPUTE TEMP_3 = 7 + 9
       COMPUTE TEMP_4 = TEMP_3 * 2
       COMPUTE TEMP_2 = TEMP_4
       DISPLAY TEMP_2
       EXIT.


