       IDENTIFICATION DIVISION.
       PROGRAM-ID. DayOfWeek.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TESTSCOPED_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TESTSCOPED_GLOBAL
       01  sc_main         PIC X(100).
       01  day_main        PIC S9(5).
       01 TEMP_0 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
       DISPLAY "Enter day number (1-7): " WITH NO ADVANCING
       ACCEPT day_main
       SUBTRACT 1 FROM day_main GIVING TEMP_0
       EVALUATE TEMP_0
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


