       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_01_08.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_01_08_GLOBAL
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
       DISPLAY "Perimeter = "
       COMPUTE TEMP_1 = 5 * 5
       COMPUTE TEMP_2 = 3 * 14159
       COMPUTE TEMP_0 = TEMP_2
       DISPLAY TEMP_0
       DISPLAY "Area = "
       COMPUTE TEMP_4 = 5 * 5
       COMPUTE TEMP_5 = 3 * 14159
       COMPUTE TEMP_3 = TEMP_5
       DISPLAY TEMP_3
       EXIT.


