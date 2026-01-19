       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_04_11.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_04_11_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_04_11_GLOBAL
       01  input_main      PIC X(100).
       01  decimal_main    PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
      * Prompt the user to enter an integer between 0 and 15
       DISPLAY "Enter a decimal value (0 to 15): " WITH NO ADVANCING
       ACCEPT decimal_main
      * Display its corresponding hex number
       IF decimal_main >= 0  AND  decimal_main <= 9
       DISPLAY "The hex value is "
       DISPLAY decimal_main
       ELSE
       IF decimal_main >= 10  AND  decimal_main <= 15
       DISPLAY "The hex value is "
       COMPUTE TEMP_1 = ORD + A
       COMPUTE TEMP_2 = TEMP_1 - 10
       COMPUTE TEMP_0 = TEMP_2
       DISPLAY TEMP_0
       ELSE
       DISPLAY decimal_main
       DISPLAY " is an invalid input"
       END-IF
       END-IF
       EXIT.


