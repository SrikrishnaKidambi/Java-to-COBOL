       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_05_38.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_05_38_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_38_GLOBAL
       01  input_main      PIC X(100).
       01  decimal_main    PIC S9(5).
       01  octal_main      PIC X(100).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_38_GLOBAL
       01  i_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Create a Scanner
      * Input from ODT is enabled
      * Prompt the user to enter a decimal integer
       DISPLAY "Enter a decimal integer: " WITH NO ADVANCING
       ACCEPT decimal_main
      * Convet decimal to octal
      * Hold octal value
       MOVE "" TO octal_main
       PERFORM VARYING i_main FROM decimal_main BY 1 UNTIL NOT (i_main > 0)
       DIVIDE i_main BY 8 GIVING TEMP_0 REMAINDER TEMP_1
       COMPUTE TEMP_2 = TEMP_1 + octal_main
       COMPUTE octal_main = TEMP_2
       END-PERFORM
      * Display results
       DISPLAY "The octal of "
       DISPLAY decimal_main
       DISPLAY " is "
       DISPLAY octal_main
       EXIT.


