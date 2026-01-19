       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_04_24.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_04_24_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_04_24_GLOBAL
       01  input_main      PIC X(100).
       01  city1_main      PIC X(100).
       01  city2_main      PIC X(100).
       01  city3_main      PIC X(100).
       01  temp_main       PIC X(100).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).
       01 TEMP_4 PIC S9(9).
       01 TEMP_5 PIC S9(9).
       01 TEMP_6 PIC S9(9).
       01 TEMP_7 PIC S9(9).
       01 TEMP_8 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
      * Prompt the user to enter three cities
       DISPLAY "Enter the first city: " WITH NO ADVANCING
       ACCEPT city1_main
       DISPLAY "Enter the second city: " WITH NO ADVANCING
       ACCEPT city2_main
       DISPLAY "Enter the third city: " WITH NO ADVANCING
       ACCEPT city3_main
       COMPUTE TEMP_1 = compareTo ( city1_main
       COMPUTE TEMP_0 = TEMP_1
       COMPUTE TEMP_3 = compareTo ( city3_main
       COMPUTE TEMP_2 = TEMP_3
       IF TEMP_0 < 0)  AND  TEMP_2 < 0)
       MOVE city1_main TO temp_main
       MOVE city2_main TO city1_main
       MOVE temp_main TO city2_main
       ELSE
       COMPUTE TEMP_5 = compareTo ( city1_main
       COMPUTE TEMP_4 = TEMP_5
       COMPUTE TEMP_7 = compareTo ( city2_main
       COMPUTE TEMP_6 = TEMP_7
       IF TEMP_4 < 0)  AND  TEMP_6 < 0)
       MOVE city1_main TO temp_main
       MOVE city3_main TO city1_main
       MOVE temp_main TO city3_main
       END-IF
       END-IF
       COMPUTE TEMP_8 = city2_main
       IF TEMP_8 < 0
       MOVE city2_main TO temp_main
       MOVE city3_main TO city2_main
       MOVE temp_main TO city3_main
       END-IF
      * Display cities in ascending order
       DISPLAY "The three cities in alphabetical order are "
       DISPLAY city1_main
       DISPLAY " "
       DISPLAY city2_main
       DISPLAY " "
       DISPLAY city3_main
       EXIT.


