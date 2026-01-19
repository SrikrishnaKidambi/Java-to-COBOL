       IDENTIFICATION DIVISION.
       PROGRAM-ID. EvenOdd.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TESTSCOPED_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TESTSCOPED_GLOBAL
       01  sc_main         PIC X(100).
       01  num_main        PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
       DISPLAY "Enter a number: " WITH NO ADVANCING
       ACCEPT num_main
       DIVIDE num_main BY 2 GIVING TEMP_0 REMAINDER TEMP_0
       COMPUTE TEMP_1 = FUNCTION MIN(2  3) + 2
       IF TEMP_0 = 0  AND  TEMP_1 >= 3
       DISPLAY "Even number"
       ELSE
       DISPLAY "Odd number"
       END-IF
       EXIT.


