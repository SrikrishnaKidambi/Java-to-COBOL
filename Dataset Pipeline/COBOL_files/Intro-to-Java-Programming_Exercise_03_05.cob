       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_03_05.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_03_05_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_03_05_GLOBAL
       01  input_main      PIC X(100).
       01  day_main        PIC S9(5).
       01  daysElapsed_main PIC S9(5).
       01  futureDay_main  PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
      * Prompt the user to enter an integer for today's day of the week
       DISPLAY "Enter today’s day: " WITH NO ADVANCING
       ACCEPT day_main
      * Prompt the user to enter the number of days after today
       DISPLAY "Enter the number of days elapsed since today: " WITH NO ADVANCING
       ACCEPT daysElapsed_main
      * Calculate future day
       COMPUTE TEMP_0 = day_main + daysElapsed_main
       DIVIDE TEMP_0 BY 7 GIVING TEMP_1 REMAINDER TEMP_2
       COMPUTE futureDay_main = TEMP_2
       DISPLAY "Today is " WITH NO ADVANCING
       EVALUATE day_main
       WHEN 0
       DISPLAY "Sunday" WITH NO ADVANCING
       WHEN 1
       DISPLAY "Monday" WITH NO ADVANCING
       WHEN 2
       DISPLAY "Tuesday" WITH NO ADVANCING
       WHEN 3
       DISPLAY "Wednesday" WITH NO ADVANCING
       WHEN 4
       DISPLAY "Thursday" WITH NO ADVANCING
       WHEN 5
       DISPLAY "Friday" WITH NO ADVANCING
       WHEN 6
       DISPLAY "Saturday" WITH NO ADVANCING
       END-EVALUATE
       DISPLAY " and the future day is " WITH NO ADVANCING
       EVALUATE futureDay_main
       WHEN 0
       DISPLAY "Sunday"
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
       END-EVALUATE
       EXIT.


