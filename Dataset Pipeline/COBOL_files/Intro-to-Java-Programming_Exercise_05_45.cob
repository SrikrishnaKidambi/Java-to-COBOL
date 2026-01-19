       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_05_45.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_05_45_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_45_GLOBAL
       01  input_main      PIC X(100).
       01  mean_main       PIC S9(5)V9(2).
       01  deviation_main  PIC S9(5)V9(2).
       01  number_main     PIC S9(5)V9(2).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_45_GLOBAL
       01  i_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).
       01 TEMP_4 PIC S9(9).
       01 TEMP_5 PIC S9(9).
       01 TEMP_6 PIC S9(9).
       01 TEMP_7 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
      * Set mean and deviation to 0
       COMPUTE mean_main = 0
      * Prompt the user to enter ten numbers
       DISPLAY "Enter ten numbers: " WITH NO ADVANCING
      * Compute mean and standard deviation
       PERFORM VARYING i_main FROM 1 BY 1 UNTIL NOT (i_main <= 10)
       ACCEPT number_main
       ADD mean_main TO number_main GIVING mean_main
       COMPUTE TEMP_0 = number_main + 2
       COMPUTE deviation_main = TEMP_0
       END-PERFORM
       COMPUTE TEMP_1 = 2 / 10
       COMPUTE TEMP_2 = mean_main - TEMP_1
       COMPUTE TEMP_3 = 10 - 1
       COMPUTE TEMP_4 = TEMP_2 / TEMP_3
       COMPUTE deviation_main = TEMP_4
       DIVIDE mean_main BY 10 GIVING mean_main
      * Display results
       DISPLAY "The mean is "
       DISPLAY mean_main
       DIVIDE n BY deviation_main GIVING TEMP_6 REMAINDER TEMP_7
       COMPUTE TEMP_5 = TEMP_7
       DISPLAY TEMP_5 WITH NO ADVANCING
       EXIT.


