       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_04_01.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_04_01_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_04_01_GLOBAL
       01  input_main      PIC X(100).
       01  r_main          PIC S9(5)V9(2).
       01  s_main          PIC S9(5)V9(2).
       01  area_main       PIC S9(5)V9(2).
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


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
      * prompt the user to enter the length from
      * the center of a pentagon to a vertex
       DISPLAY "Enter the length from the center to a vertex: " WITH NO ADVANCING
       ACCEPT r_main
      * Compute the area of the pentagon
      * Length of a side
       COMPUTE TEMP_0 = 2 * r_main
       COMPUTE TEMP_1 = PI / 5
       COMPUTE TEMP_2 = Math * TEMP_1
       COMPUTE s_main = TEMP_2
       COMPUTE TEMP_3 = s_main * 2
       COMPUTE TEMP_4 = PI / 5
       COMPUTE TEMP_5 = Math * TEMP_4
       COMPUTE TEMP_6 = TAN / TEMP_5
       COMPUTE area_main = TEMP_6
      * Display results
       DIVIDE n BY area_main GIVING TEMP_8 REMAINDER TEMP_9
       COMPUTE TEMP_7 = TEMP_9
       DISPLAY TEMP_7 WITH NO ADVANCING
       EXIT.


