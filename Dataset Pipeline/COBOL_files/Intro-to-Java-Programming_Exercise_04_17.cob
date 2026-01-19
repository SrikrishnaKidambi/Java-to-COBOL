       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_04_17.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_04_17_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_04_17_GLOBAL
       01  input_main      PIC X(100).
       01  year_main       PIC S9(5).
       01  month_main      PIC X(100).
       01  leapYear_main   PIC X(1).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
      * Prompt the user to enter a year and
      * the first three letter of a month name
       DISPLAY "Enter a year: " WITH NO ADVANCING
       ACCEPT year_main
       DISPLAY "Enter a month: " WITH NO ADVANCING
       ACCEPT month_main
      * Test for leap year
      * Display the number of day in the month
       DISPLAY month_main WITH NO ADVANCING
       DISPLAY " " WITH NO ADVANCING
       DISPLAY year_main WITH NO ADVANCING
       DISPLAY " has " WITH NO ADVANCING
       IF month_main.equals("Jan")  OR  month_main.equals("Mar")  OR  month_main.equals("May")  OR  month_main.equals("Jul")  OR  month_main.equals("Aug")  OR  month_main.equals("Oct")  OR  month_main.equals("Dec")
       DISPLAY 31
       DISPLAY " days"
       ELSE
       IF month_main.equals("Apr")  OR  month_main.equals("Jun")  OR  month_main.equals("Sep")  OR  month_main.equals("Nov")
       DISPLAY 30
       DISPLAY " days"
       ELSE
       DISPLAY ((leapYear_main) ? 29 : 28)
       DISPLAY " days"
       END-IF
       END-IF
       EXIT.


