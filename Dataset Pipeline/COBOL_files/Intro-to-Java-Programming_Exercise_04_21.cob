       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_04_21.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_04_21_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_04_21_GLOBAL
       01  input_main      PIC X(100).
       01  ssn_main        PIC X(100).
       01  isValid_main    PIC X(1).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
      * Prompt the user to enter a Social Security number
       DISPLAY "Enter a SSN: " WITH NO ADVANCING
       ACCEPT ssn_main
      * Check whether the input is valid
      * Display result
       DISPLAY ssn_main
       DISPLAY " is "
       DISPLAY ((isValid_main) ? "a valid " : "an invalid ")
       DISPLAY "social security number"
       EXIT.


