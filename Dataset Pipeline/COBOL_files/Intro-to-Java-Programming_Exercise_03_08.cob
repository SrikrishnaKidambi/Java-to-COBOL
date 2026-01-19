       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_03_08.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_03_08_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_03_08_GLOBAL
       01  input_main      PIC X(100).
       01  number1_main    PIC S9(5).
       01  number2_main    PIC S9(5).
       01  number3_main    PIC S9(5).
       01  temp_main       PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
      * Prompt the user to enter three integers
       DISPLAY "Enter three integers: " WITH NO ADVANCING
       ACCEPT number1_main
       ACCEPT number2_main
       ACCEPT number3_main
      * Sort numbers
       IF number2_main < number1_main  OR  number3_main < number1_main
       IF number2_main < number1_main
       MOVE number1_main TO temp_main
       MOVE number2_main TO number1_main
       MOVE temp_main TO number2_main
       END-IF
       IF number3_main < number1_main
       MOVE number1_main TO temp_main
       MOVE number3_main TO number1_main
       MOVE temp_main TO number3_main
       END-IF
       END-IF
       IF number3_main < number2_main
       MOVE number2_main TO temp_main
       MOVE number3_main TO number2_main
       MOVE temp_main TO number3_main
       END-IF
      * Display numbers in accending order
       DISPLAY number1_main
       DISPLAY " "
       DISPLAY number2_main
       DISPLAY " "
       DISPLAY number3_main
       EXIT.


