       IDENTIFICATION DIVISION.
       PROGRAM-ID. SumOfDigits.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_-ARRAY    .
           05  args         PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  sc              PIC X(100).
       01  num             PIC S9(5).
       01  sum1             PIC S9(5).
      * Variables for Scope:BLOCK_WHILE_BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  rem             PIC S9(5).


       PROCEDURE DIVISION.


       MAIN-PARA.
      * Input from ODT is enabled
       DISPLAY "Enter a number: " WITH NO ADVANCING
       ACCEPT num
       MOVE 0 TO sum1
       PERFORM UNTIL NOT (num > 0)
       DIVIDE num BY 10 GIVING rem REMAINDER rem
       ADD sum1 TO rem GIVING sum1
       DIVIDE num BY 10 GIVING num
       END-PERFORM
       DISPLAY "Sum of digits: "   sum1
       EXIT.
       STOP RUN.

