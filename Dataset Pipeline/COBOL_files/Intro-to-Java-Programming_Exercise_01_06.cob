       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_01_06.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_01_06_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       DISPLAY 1
       DISPLAY 2
       DISPLAY 3
       DISPLAY 4
       DISPLAY 5
       DISPLAY 6
       DISPLAY 7
       DISPLAY 8
       DISPLAY 9
       EXIT.


