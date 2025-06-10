       IDENTIFICATION DIVISION.
       PROGRAM-ID. TestCase2.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_-ARRAY    .
           05  args         PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  rand            PIC S9(5)V9(2).
       01  sqrtVal         PIC S9(5)V9(2).


       PROCEDURE DIVISION.


       MAIN-PARA.
       COMPUTE sqrtVal = FUNCTION SQRT(25)
       DISPLAY "Random: "   rand
       IF sqrtVal = 5
       DISPLAY "Sqrt works correctly!"
       END-IF
       EXIT.
       STOP RUN.

