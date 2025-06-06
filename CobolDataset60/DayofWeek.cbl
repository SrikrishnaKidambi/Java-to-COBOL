       IDENTIFICATION DIVISION.
       PROGRAM-ID. DayOfWeek.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_-ARRAY    .
           05  args         PIC X(10) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  sc              PIC X(10).
       01  day             PIC S9(5).


       PROCEDURE DIVISION.


       MAIN-PARA.
      * Input from ODT is enabled
       DISPLAY "Enter day number (1-7): "WITH NO ADVANCING
       ACCEPT day
       EVALUATE day
       WHEN 1
       DISPLAY "Monday"
       WHEN 2
       DISPLAY "Tuesday"
       WHEN 3
       DISPLAY "Wednesday"
       WHEN 4
       DISPLAY "Thursday"
       WHEN 5
       DISPLAY "Friday"
       WHEN 6
       DISPLAY "Saturday"
       WHEN 7
       DISPLAY "Sunday"
       WHEN OTHER
       DISPLAY "Invalid day number"
       END-EVALUATE
       EXIT.
       STOP RUN.

