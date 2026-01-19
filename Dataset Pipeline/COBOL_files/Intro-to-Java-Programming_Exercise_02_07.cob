       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_02_07.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_02_07_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_02_07_GLOBAL
       01  input_main      PIC X(100).
       01  minutes_main    PIC S9(5).
       01  years_main      PIC S9(5).
       01  days_main       PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
      * Prompt the user to enter the number of minutes
       DISPLAY "Enter the number of minutes: " WITH NO ADVANCING
       ACCEPT minutes_main
      * Compute the number of years and days
       DIVIDE minutes_main BY 525600 GIVING years_main
       DIVIDE minutes_main BY 525600 GIVING TEMP_0 REMAINDER TEMP_1
       COMPUTE TEMP_2 = TEMP_1 / 1440
       COMPUTE days_main = TEMP_2
      * Display results
       DISPLAY minutes_main
       DISPLAY " minutes is approximately "
       DISPLAY years_main
       DISPLAY " years and "
       DISPLAY days_main
       DISPLAY " days"
       EXIT.


