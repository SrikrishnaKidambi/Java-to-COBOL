       IDENTIFICATION DIVISION.
       PROGRAM-ID. DayInWeek.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_-ARRAY    .
           05  args         PIC X(10) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  scanner         PIC X(10).
       01  day             PIC S9(5).


       PROCEDURE DIVISION.


       MAIN-PARA.
      * Input from ODT is enabled
      * Take input from user
      * Take input from user
       DISPLAY "Enter a number (1-7) for the day of the week: ".
       ACCEPT day.
      * Determine day using switch-case
      * Determine day using switch-case
       EVALUATE day
       WHEN 1
       DISPLAY "Sunday"
       WHEN 2
       DISPLAY "Monday"
       WHEN 3
       DISPLAY "Tuesday"
       WHEN 4
       DISPLAY "Wednesday"
       WHEN 5
       DISPLAY "Thursday"
       WHEN 6
       DISPLAY "Friday"
       WHEN 7
       DISPLAY "Saturday"
       WHEN OTHER
       DISPLAY "Invalid input! Please enter a number between 1 and 7."
       END-EVALUATE.
       EXIT.
       STOP RUN.

