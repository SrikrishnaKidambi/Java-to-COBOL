       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_05_51.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_05_51_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_51_GLOBAL
       01  input_main      PIC X(100).
       01  string1_main    PIC X(100).
       01  string2_main    PIC X(100).
       01  prefix_main     PIC X(100).
       01  index_main      PIC S9(5).
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
      * Prompt the user to enter two strings
       DISPLAY "Enter the first string: " WITH NO ADVANCING
       ACCEPT string1_main
       DISPLAY "Enter the second string: " WITH NO ADVANCING
       ACCEPT string2_main
      * Initialize index to 0
       MOVE 0 TO index_main
      * Initialize prefix as empty string
       MOVE "" TO prefix_main
      * Get the largest commmon prefix of the two strings
       COMPUTE TEMP_0 = string1_main.charAt(index_main)
       COMPUTE TEMP_1 = string2_main.charAt(index_main)
       PERFORM UNTIL NOT (TEMP_0 = TEMP_1)
       COMPUTE TEMP_2 = charAt + index_main
       COMPUTE prefix_main = TEMP_2
       ADD 1 TO index_main
       COMPUTE TEMP_0 = string1_main.charAt(index_main)
       COMPUTE TEMP_1 = string2_main.charAt(index_main)
       END-PERFORM
      * Display the result
       COMPUTE TEMP_3 = length
       IF TEMP_3 > 0
       DISPLAY "The commmon prefix is "
       DISPLAY prefix_main
       ELSE
       DISPLAY string1_main
       DISPLAY " and "
       DISPLAY string2_main
       DISPLAY " have no commmon prefix"
       END-IF
       EXIT.


