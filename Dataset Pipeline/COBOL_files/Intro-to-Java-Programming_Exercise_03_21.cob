       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_03_21.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_03_21_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_03_21_GLOBAL
       01  input_main      PIC X(100).
       01  year_main       PIC S9(5).
       01  month_main      PIC S9(5).
       01  dayOfMonth_main PIC S9(5).
       01  dayOfWeek_main  PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).
       01 TEMP_4 PIC S9(9).
       01 TEMP_5 PIC S9(9).
       01 TEMP_6 PIC S9(9).
       01 TEMP_7 PIC S9(9).
       01 TEMP_8 PIC S9(9).
       01 TEMP_9 PIC S9(9).
       01 TEMP_10 PIC S9(9).
       01 TEMP_11 PIC S9(9).
       01 TEMP_12 PIC S9(9).
       01 TEMP_13 PIC S9(9).
       01 TEMP_14 PIC S9(9).
       01 TEMP_15 PIC S9(9).
       01 TEMP_16 PIC S9(9).
       01 TEMP_17 PIC S9(9).
       01 TEMP_18 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
      * Prompt the user to enter a year, month, and day of the month.
       DISPLAY "Enter year: (e.g., 2012): " WITH NO ADVANCING
       ACCEPT year_main
       DISPLAY "Enter month: 1-12: " WITH NO ADVANCING
       ACCEPT month_main
       DISPLAY "Enter the day of the month: 1-31: " WITH NO ADVANCING
       ACCEPT dayOfMonth_main
      * Convert January and February to months 13 and 14 of the previous year
       IF month_main = 1  OR  month_main = 2
       COMPUTE month_main = 14
       SUBTRACT 1 FROM year_main
       END-IF
      * Calculate day of the week
       COMPUTE TEMP_0 = month_main + 1
       COMPUTE TEMP_1 = 26 * TEMP_0
       COMPUTE TEMP_2 = TEMP_1 / 10
       COMPUTE TEMP_3 = dayOfMonth_main + TEMP_2
       DIVIDE year_main BY 100 GIVING TEMP_4 REMAINDER TEMP_5
       COMPUTE TEMP_6 = TEMP_3 + TEMP_5
       DIVIDE year_main BY 100 GIVING TEMP_7 REMAINDER TEMP_8
       COMPUTE TEMP_9 = TEMP_8 / 4
       COMPUTE TEMP_10 = TEMP_6 + TEMP_9
       COMPUTE TEMP_11 = year_main / 100
       COMPUTE TEMP_12 = TEMP_11 / 4
       COMPUTE TEMP_13 = TEMP_10 + TEMP_12
       COMPUTE TEMP_14 = year_main / 100
       COMPUTE TEMP_15 = 5 * TEMP_14
       COMPUTE TEMP_16 = TEMP_13 + TEMP_15
       DIVIDE TEMP_16 BY 7 GIVING TEMP_17 REMAINDER TEMP_18
       COMPUTE dayOfWeek_main = TEMP_18
      * Display reslut
       DISPLAY "Day of the week is " WITH NO ADVANCING
       EVALUATE dayOfWeek_main
       WHEN 0
       DISPLAY "Saturday"
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
       END-EVALUATE
       EXIT.


