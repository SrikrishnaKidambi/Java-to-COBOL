       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_05_47.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_05_47_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_47_GLOBAL
       01  input_main      PIC X(100).
       01  isbn_main       PIC X(100).
       01  checksum_main   PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_47_GLOBAL
       01  i_main          PIC S9(5).
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


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
      * Prompt the user to enter the first 12 digits of an ISBN-13 as string
       DISPLAY "Enter the first 12 digits of an ISBN-13 as a string: " WITH NO ADVANCING
       ACCEPT isbn_main
      * Verify string length
       COMPUTE TEMP_0 = length
       IF TEMP_0 != 12
       DISPLAY isbn_main
       DISPLAY " is an invalid input"
       STOP RUN
       END-IF
      * Holds the checksum value
       MOVE 0 TO checksum_main
      * Calculate the checksum
       COMPUTE TEMP_1 = isbn_main.length()
       PERFORM VARYING i_main FROM 0 BY 1 UNTIL NOT (i_main < TEMP_1)
       DIVIDE 0 BY 3 GIVING TEMP_2 REMAINDER TEMP_3
       COMPUTE TEMP_4 = charAt + i_main
       COMPUTE TEMP_5 = charAt + i_main
       COMPUTE TEMP_6 = isbn_main * TEMP_5
       COMPUTE TEMP_7 = NUMVAL + TEMP_6
       COMPUTE checksum_main = TEMP_7
       COMPUTE TEMP_1 = isbn_main.length()
       END-PERFORM
       DIVIDE checksum_main BY 10 GIVING TEMP_8 REMAINDER TEMP_9
       COMPUTE TEMP_10 = 10 - TEMP_9
       COMPUTE checksum_main = TEMP_10
      * Print the result if checksum is 10, replace it with 0
       DISPLAY "The ISBN-13 number is "
       DISPLAY isbn_main
       DISPLAY (checksum_main == 10 ? 0 : checksum_main)
       EXIT.


