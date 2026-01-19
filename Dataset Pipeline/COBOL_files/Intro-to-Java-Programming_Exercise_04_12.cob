       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_04_12.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_04_12_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_04_12_GLOBAL
       01  input_main      PIC X(100).
       01  hexString_main  PIC X(100).
       01  ch_main         PIC X(1).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).
       01 TEMP_4 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
      * Prompt the user to enter a hex digit
       DISPLAY "Enter a hex digit: " WITH NO ADVANCING
       ACCEPT hexString_main
      * Check if the hex string has exactly one character
       COMPUTE TEMP_0 = length
       IF TEMP_0 != 1
       DISPLAY "You must enter exactly one character"
       STOP RUN
       END-IF
      * Display binary number for the hex digit
       MOVE FUNCTION CHAR(hexString_main.charAt(0)) TO ch_main
       COMPUTE TEMP_2 = ORD ( ch_main
       COMPUTE TEMP_1 = TEMP_2
       COMPUTE TEMP_4 = ORD ( ch_main
       COMPUTE TEMP_3 = TEMP_4
       IF TEMP_1 >= 'A'  AND  ch_main <= 'F')  OR  TEMP_3 >= 0  AND  ch_main <= 9)
       DISPLAY "The binary value is " WITH NO ADVANCING
       EVALUATE ch_main
       WHEN 0
       DISPLAY 0000
       WHEN 1
       DISPLAY 0001
       WHEN 2
       DISPLAY 0010
       WHEN 3
       DISPLAY 0011
       WHEN 4
       DISPLAY 0100
       WHEN 5
       DISPLAY 0101
       WHEN 6
       DISPLAY 0110
       WHEN 7
       DISPLAY 0111
       WHEN 8
       DISPLAY 1000
       WHEN 9
       DISPLAY 1001
       WHEN 'A'
       DISPLAY 1010
       WHEN 'B'
       DISPLAY 1011
       WHEN 'C'
       DISPLAY 1100
       WHEN 'D'
       DISPLAY 1101
       WHEN 'E'
       DISPLAY 1110
       WHEN 'F'
       DISPLAY 1111
       END-EVALUATE
       ELSE
       DISPLAY ch_main
       DISPLAY " is and invalid input"
       END-IF
       EXIT.


