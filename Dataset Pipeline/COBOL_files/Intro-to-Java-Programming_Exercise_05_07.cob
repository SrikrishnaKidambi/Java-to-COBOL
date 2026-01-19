       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_05_07.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_05_07_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_07_GLOBAL
       01  totalCost_main  PIC S9(5).
       01  tuition_main    PIC S9(5).
       01  tuitionTenthYear_main PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_07_GLOBAL
       01  year_main       PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Accumulate total cost of four years tution
       MOVE 0 TO totalCost_main
       MOVE 10000 TO tuition_main
       PERFORM VARYING year_main FROM 1 BY 1 UNTIL NOT (year_main <= 14)
      * Increase tution by 5% every year
       COMPUTE TEMP_0 = 0 * 05
       COMPUTE TEMP_1 = tuition_main + TEMP_0
       COMPUTE tuition_main = TEMP_1
       IF year_main > 10
      * Accumulate tution cost
       ADD totalCost_main TO tuition_main GIVING totalCost_main
       END-IF
      * Cost of tution in ten years
       IF year_main = 10
       MOVE tuition_main TO tuitionTenthYear_main
       END-IF
       END-PERFORM
      * Display the cost of tution in ten years
       DISPLAY "Tuition in ten years: $"
       DISPLAY tuitionTenthYear_main
      * Display the cost of four years' worth of tution after tenth year
       DISPLAY "Total cost for four years' worth of tuition"
       DISPLAY " after the tenth year: $"
       DISPLAY totalCost_main
       EXIT.


