       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_02_08.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_02_08_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_02_08_GLOBAL
       01  input_main      PIC X(100).
       01  offset_main     PIC S9(5).
       01  totalMilliseconds_main PIC S9(5).
       01  totalSeconds_main PIC S9(5).
       01  currentSecond_main PIC S9(5).
       01  totalMinutes_main PIC S9(5).
       01  currentMinute_main PIC S9(5).
       01  totalHours_main PIC S9(5).
       01  currentHour_main PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Create new Scanner object
      * Input from ODT is enabled
      * Prompt user to enter the time offset of GMT
       DISPLAY "Enter the time zone offset to GMT: " WITH NO ADVANCING
       ACCEPT offset_main
      * Obtain the total milliseconds since midnight, Jan 1, 1970
      * Obtain the total seconds since midnight, Jan 1, 1970
       DIVIDE totalMilliseconds_main BY 1000 GIVING totalSeconds_main
      * Compute the current second in the minute in the hour
       DIVIDE totalSeconds_main BY 60 GIVING currentSecond_main REMAINDER currentSecond_main
      * Obtain the total minutes
       DIVIDE totalSeconds_main BY 60 GIVING totalMinutes_main
      * Compute the current minute in the hour
       DIVIDE totalMinutes_main BY 60 GIVING currentMinute_main REMAINDER currentMinute_main
      * Obtain the total hours
       DIVIDE totalMinutes_main BY 60 GIVING totalHours_main
      * Compute the current hour
       DIVIDE totalHours_main BY 24 GIVING currentHour_main REMAINDER currentHour_main
       ADD currentHour_main TO offset_main GIVING currentHour_main
      * Display results
       DISPLAY "Current time is "
       DISPLAY currentHour_main
       DISPLAY ":"
       DISPLAY currentMinute_main
       DISPLAY ":"
       DISPLAY currentSecond_main
       EXIT.


