       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_05_44.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_05_44_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_44_GLOBAL
       01  input_main      PIC X(100).
       01  number_main     PIC X(100).
       01  bits_main       PIC X(100).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_44_GLOBAL
       01  i_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
      * Prompt the user to enter a short integer
       DISPLAY "Enter an integer: " WITH NO ADVANCING
       ACCEPT number_main
      * Holds the bits
       MOVE "" TO bits_main
      * Get the 16 bits for the integer
       PERFORM VARYING i_main FROM 0 BY 1 UNTIL NOT (i_main < 16)
       COMPUTE TEMP_0 = 1 + bits_main
       COMPUTE bits_main = TEMP_0
       END-PERFORM
      * Display result
       DISPLAY "The bits are "
       DISPLAY bits_main
       EXIT.


