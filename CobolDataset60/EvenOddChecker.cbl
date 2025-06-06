       IDENTIFICATION DIVISION.
       PROGRAM-ID. EvenOddChecker.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_-ARRAY    .
           05  args         PIC X(10) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_CHECKEVENODD_CLASS_TEST_GLOBAL
       01  sc              PIC X(10).
       01  n               PIC S9(5).
       01  rem             PIC S9(5).


       PROCEDURE DIVISION.


       MAIN-PARA.
       PERFORM checkEvenOdd-PARA
       EXIT.

       checkEvenOdd-PARA.
      * Input from ODT is enabled
       DISPLAY "Enter a number: " WITH NO ADVANCING
       ACCEPT n
       DIVIDE n BY 2 GIVING rem REMAINDER rem
       IF rem = 0
       DISPLAY "Even"
       ELSE
       DISPLAY "Odd"
       END-IF
       EXIT.
       STOP RUN.

