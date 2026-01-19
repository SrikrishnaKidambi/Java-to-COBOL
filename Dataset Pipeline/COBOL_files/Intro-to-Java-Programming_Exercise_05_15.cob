       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_05_15.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_05_15_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_15_GLOBAL
       01  NUMBER_OF_CHARACTERS_PER_LINE_main PIC S9(5).
       01  count_main      PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_15_GLOBAL
       01  i_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Number of characters per line
      * Count the number of characters
       MOVE 0 TO count_main
      * Print the ASCII characters from ! to ~
       PERFORM VARYING i_main FROM 33 BY 1 UNTIL NOT (i_main <= 126)
      * Increment count
       ADD 1 TO count_main
      * Display 10 characters per line
       DIVIDE count_main BY 10 GIVING TEMP_0 REMAINDER TEMP_0
       IF TEMP_0 = 0
       DISPLAY (char) i_main
       ELSE
       DISPLAY (char) i_main WITH NO ADVANCING
       DISPLAY " " WITH NO ADVANCING
       END-IF
       END-PERFORM
       EXIT.


