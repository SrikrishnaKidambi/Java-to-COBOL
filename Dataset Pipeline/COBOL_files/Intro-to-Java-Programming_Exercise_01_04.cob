       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_01_04.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_01_04_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       DISPLAY "a	a^2	 a^3"
       DISPLAY "1	1  	 1"
       DISPLAY "2	4  	 8"
       DISPLAY "3	9  	 27"
       DISPLAY "4	10 	 64"
       EXIT.


