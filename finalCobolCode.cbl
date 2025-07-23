       IDENTIFICATION DIVISION.
       PROGRAM-ID. DayOfWeek.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:BLOCK_METHOD_CONVERTTOLOWERCASE_CLASS_TESTSCOPED_GLOBAL
       01  name_convertToLowercase PIC X(100).
      * Variables for Scope:METHOD_MAIN_CLASS_TESTSCOPED_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TESTSCOPED_GLOBAL
       01  sc_main         PIC X(100).
       01  day_main        PIC S9(5).



       MAIN-PARA.
      * Input from ODT is enabled
       DISPLAY "Enter day number (1-7): " WITH NO ADVANCING
       ACCEPT day_main
       EVALUATE day_main
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
       STOP RUN.

