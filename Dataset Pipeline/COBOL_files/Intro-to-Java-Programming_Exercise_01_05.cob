       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_01_05.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_01_05_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
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
       DISPLAY "9.5 X 4.5 - 2.5 X 3"
       DISPLAY "-------------------"
       DISPLAY "     45.5 - 3.5"
       DISPLAY "         ="
       COMPUTE TEMP_1 = 4 * 5
       COMPUTE TEMP_2 = 5 * 3
       COMPUTE TEMP_3 = 2 - TEMP_2
       COMPUTE TEMP_4 = 3 - 5
       COMPUTE TEMP_5 = 5 / TEMP_4
       COMPUTE TEMP_0 = TEMP_5
       DISPLAY TEMP_0
       EXIT.


