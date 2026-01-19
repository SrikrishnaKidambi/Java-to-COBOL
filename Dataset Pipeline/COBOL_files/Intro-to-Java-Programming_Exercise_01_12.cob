       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_01_12.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_01_12_GLOBAL
       01  AGRS_MAIN_-ARRAY.
           05  agrs_main    PIC X(100) OCCURS 100 TIMES.
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).
       01 TEMP_4 PIC S9(9).
       01 TEMP_5 PIC S9(9).
       01 TEMP_6 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       DISPLAY "Miles / (hour + (minutes / 60) + (seconds / 3600)) * 1.6"
       DISPLAY "24    / (1    + (40      / 60) + (35      / 3600))  * 1.6"
       COMPUTE TEMP_1 = 60 / 0
       COMPUTE TEMP_2 = 40 + TEMP_1
       COMPUTE TEMP_3 = 3600 / 0
       COMPUTE TEMP_4 = 35 + TEMP_3
       COMPUTE TEMP_5 = TEMP_2 / TEMP_4
       COMPUTE TEMP_6 = 1 * 6
       COMPUTE TEMP_0 = TEMP_6
       DISPLAY TEMP_0
       EXIT.


