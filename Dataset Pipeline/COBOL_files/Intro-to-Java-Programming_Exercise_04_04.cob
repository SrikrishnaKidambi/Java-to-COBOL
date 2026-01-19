       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_04_04.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_04_04_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_04_04_GLOBAL
       01  input_main      PIC X(100).
       01  s_main          PIC S9(5)V9(2).
       01  area_main       PIC S9(5)V9(2).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).
       01 TEMP_4 PIC S9(9).
       01 TEMP_5 PIC S9(9).
       01 TEMP_6 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
      * Prompt the user to enter the side of a hexagon
       DISPLAY "Enter the side: " WITH NO ADVANCING
       ACCEPT s_main
      * Compute the area of a hexagon
       COMPUTE TEMP_0 = s_main * 2
       COMPUTE TEMP_1 = PI / 6
       COMPUTE TEMP_2 = Math * TEMP_1
       COMPUTE TEMP_3 = TAN / TEMP_2
       COMPUTE area_main = TEMP_3
      * Display result
       DIVIDE n BY area_main GIVING TEMP_5 REMAINDER TEMP_6
       COMPUTE TEMP_4 = TEMP_6
       DISPLAY TEMP_4 WITH NO ADVANCING
       EXIT.


