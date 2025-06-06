       IDENTIFICATION DIVISION.
       PROGRAM-ID. DigitCounter.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_-ARRAY    .
           05  args         PIC X(10) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  sc              PIC X(10).
       01  num             PIC S9(5).
       01  count           PIC S9(5).


       PROCEDURE DIVISION.


       MAIN-PARA.
      * Input from ODT is enabled
       DISPLAY "Enter number: "
       ACCEPT num
       MOVE 0 TO count
       PERFORM WITH TEST BEFORE
       ADD 1 TO count
       DIVIDE num BY 10 GIVING num
       UNTIL NOT (num  NOT =  0).
       DISPLAY "Number of digits: "   count
       EXIT.
       STOP RUN.

