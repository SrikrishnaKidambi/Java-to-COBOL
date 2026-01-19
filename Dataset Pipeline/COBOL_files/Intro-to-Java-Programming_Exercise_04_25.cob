       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_04_25.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_04_25_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_04_25_GLOBAL
       01  letter1_main    PIC S9(5).
       01  letter2_main    PIC S9(5).
       01  letter3_main    PIC S9(5).
       01  number1_main    PIC S9(5).
       01  number2_main    PIC S9(5).
       01  number3_main    PIC S9(5).
       01  number4_main    PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).
       01 TEMP_4 PIC S9(9).
       01 TEMP_5 PIC S9(9).
       01 TEMP_6 PIC S9(9).
       01 TEMP_7 PIC S9(9).
       01 TEMP_8 PIC S9(9).
       01 TEMP_9 PIC S9(9).
       01 TEMP_10 PIC S9(9).
       01 TEMP_11 PIC S9(9).
       01 TEMP_12 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Generate three random uppercase letters
       COMPUTE TEMP_0 = 90 - 65
       COMPUTE TEMP_1 = RANDOM * TEMP_0
       COMPUTE TEMP_2 = FUNCTION + TEMP_1
       COMPUTE letter1_main = TEMP_2
       COMPUTE TEMP_3 = 90 - 65
       COMPUTE TEMP_4 = RANDOM * TEMP_3
       COMPUTE TEMP_5 = FUNCTION + TEMP_4
       COMPUTE letter2_main = TEMP_5
       COMPUTE TEMP_6 = 90 - 65
       COMPUTE TEMP_7 = RANDOM * TEMP_6
       COMPUTE TEMP_8 = FUNCTION + TEMP_7
       COMPUTE letter3_main = TEMP_8
      * Generate four random digits
       COMPUTE TEMP_9 = RANDOM * 10
       COMPUTE number1_main = TEMP_9
       COMPUTE TEMP_10 = RANDOM * 10
       COMPUTE number2_main = TEMP_10
       COMPUTE TEMP_11 = RANDOM * 10
       COMPUTE number3_main = TEMP_11
       COMPUTE TEMP_12 = RANDOM * 10
       COMPUTE number4_main = TEMP_12
      * Display number plate
       DISPLAY ""
       DISPLAY (char) (letter1_main)
       DISPLAY ((char) (letter2_main))
       DISPLAY ((char) (letter3_main))
       DISPLAY number1_main
       DISPLAY number2_main
       DISPLAY number3_main
       DISPLAY number4_main
       EXIT.


