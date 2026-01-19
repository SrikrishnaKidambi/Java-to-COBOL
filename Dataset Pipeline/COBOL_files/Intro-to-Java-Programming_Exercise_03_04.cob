       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_03_04.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_03_04_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_03_04_GLOBAL
       01  month_main      PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Generate an integer between 1 and 12.
       COMPUTE TEMP_0 = RANDOM * 12
       COMPUTE TEMP_1 = TEMP_0 + 1
       COMPUTE month_main = TEMP_1
      * Display the English month name
       EVALUATE month_main
       WHEN 1
       DISPLAY "January"
       WHEN 2
       DISPLAY "February"
       WHEN 3
       DISPLAY "March"
       WHEN 4
       DISPLAY "April"
       WHEN 5
       DISPLAY "May"
       WHEN 6
       DISPLAY "June"
       WHEN 7
       DISPLAY "July"
       WHEN 8
       DISPLAY "August"
       WHEN 9
       DISPLAY "September"
       WHEN 10
       DISPLAY "October"
       WHEN 11
       DISPLAY "November"
       WHEN 12
       DISPLAY "December"
       END-EVALUATE
       EXIT.


