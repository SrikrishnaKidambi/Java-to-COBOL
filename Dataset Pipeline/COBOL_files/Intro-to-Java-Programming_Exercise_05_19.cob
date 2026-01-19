       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_05_19.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_05_19_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_19_GLOBAL
       01  startRight_main PIC S9(5).
       01  endSpace_main   PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_19_GLOBAL
       01  row_main        PIC S9(5).
      * Variables for Scope:FOR_BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_19_GLOBAL
       01  startSpace_main PIC S9(5).
       01  l_main          PIC S9(5).
       01  r_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).
       01 TEMP_4 PIC S9(9).
       01 TEMP_5 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Display number of rows and numbers in each row
       PERFORM VARYING row_main FROM 1 BY 1 UNTIL NOT (row_main <= 128)
      * Display white space
       PERFORM VARYING startSpace_main FROM 0 BY 1 UNTIL NOT (startSpace_main < endSpace_main)
       DISPLAY "    " WITH NO ADVANCING
       END-PERFORM
      * Display acending numbers
       PERFORM VARYING l_main FROM 1 BY 1 UNTIL NOT (l_main <= row_main)
       DIVIDE 4d BY l_main GIVING TEMP_1 REMAINDER TEMP_2
       COMPUTE TEMP_0 = TEMP_2
       DISPLAY TEMP_0 WITH NO ADVANCING
       END-PERFORM
      * Display decending numbers
       PERFORM VARYING r_main FROM startRight_main BY 1 UNTIL NOT (r_main > 0)
       DIVIDE 4d BY r_main GIVING TEMP_4 REMAINDER TEMP_5
       COMPUTE TEMP_3 = TEMP_5
       DISPLAY TEMP_3 WITH NO ADVANCING
       END-PERFORM
      * End line
      * Decrement endSpace
       SUBTRACT 1 FROM endSpace_main
      * Assign row to startRight
       MOVE row_main TO startRight_main
       END-PERFORM
       EXIT.


