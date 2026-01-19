       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_03_11.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_03_11_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_03_11_GLOBAL
       01  input_main      PIC X(100).
       01  month_main      PIC S9(5).
       01  year_main       PIC S9(5).
       01  leapYear_main   PIC X(1).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
      * Prompt user to enter the month an year
       DISPLAY "Enter the month as integer: " WITH NO ADVANCING
       ACCEPT month_main
       DISPLAY "Enter the year as integer: " WITH NO ADVANCING
       ACCEPT year_main
      * Display the number of days in the month
       EVALUATE month_main
       WHEN 1
       DISPLAY "January "
       DISPLAY year_main
       DISPLAY " had 31 days"
       WHEN 2
       DISPLAY "February "
       DISPLAY year_main
       DISPLAY " had"
       DISPLAY ((leapYear_main) ? " 29 days" : " 28 days")
       WHEN 3
       DISPLAY "March "
       DISPLAY year_main
       DISPLAY " had 31 days"
       WHEN 4
       DISPLAY "April "
       DISPLAY year_main
       DISPLAY " had 30 days"
       WHEN 5
       DISPLAY "May "
       DISPLAY year_main
       DISPLAY " had 31 days"
       WHEN 6
       DISPLAY "June "
       DISPLAY year_main
       DISPLAY " had 30 days"
       WHEN 7
       DISPLAY "July "
       DISPLAY year_main
       DISPLAY " had 31 days"
       WHEN 8
       DISPLAY "August "
       DISPLAY year_main
       DISPLAY " had 31 days"
       WHEN 9
       DISPLAY "September "
       DISPLAY year_main
       DISPLAY " had 30 days"
       WHEN 10
       DISPLAY "October "
       DISPLAY year_main
       DISPLAY " had 31 days"
       WHEN 11
       DISPLAY "November "
       DISPLAY year_main
       DISPLAY " had 30 days"
       WHEN 12
       DISPLAY "December "
       DISPLAY year_main
       DISPLAY " had 31 days"
       END-EVALUATE
       EXIT.


