       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_05_36.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_05_36_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_36_GLOBAL
       01  input_main      PIC X(100).
       01  isbn_main       PIC X(100).
       01  d10_main        PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_36_GLOBAL
       01  i_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
      * Prompt the user to enter the first 9 digits of a 10-digit ISBN
       DISPLAY "Enter the first 9 digits of an ISBN as integer: " WITH NO ADVANCING
       ACCEPT isbn_main
       MOVE 0 TO d10_main
      * Extract the digits of the ISBN and compute d10
       PERFORM VARYING i_main FROM 0 BY 1 UNTIL NOT (i_main < 9)
       COMPUTE TEMP_0 = charAt + i_main
       COMPUTE TEMP_1 = i_main + 1
       COMPUTE TEMP_2 = TEMP_0 * TEMP_1
       COMPUTE TEMP_3 = isbn_main + TEMP_2
       COMPUTE d10_main = TEMP_3
       END-PERFORM
       DIVIDE d10_main BY 11 GIVING d10_main REMAINDER d10_main
      * Display the 10-digit ISBN
       PERFORM VARYING i_main FROM 0 BY 1 UNTIL NOT (i_main < 9)
       DISPLAY isbn_main.charAt(i_main) WITH NO ADVANCING
       END-PERFORM
       IF d10_main = 10
       DISPLAY "X"
       ELSE
       DISPLAY d10_main
       END-IF
       EXIT.


