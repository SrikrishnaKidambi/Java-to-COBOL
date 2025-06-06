       IDENTIFICATION DIVISION.
       PROGRAM-ID. PrimeNumbers50.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_-ARRAY    .
           05  args         PIC X(10) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  num             PIC S9(5).
      * Variables for Scope:BLOCK_WHILE_BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  isPrime         PIC X(1).
       01  i               PIC S9(5).
      * Variables for Scope:BLOCK_WHILE_BLOCK_WHILE_BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  rem             PIC S9(5).


       PROCEDURE DIVISION.


       MAIN-PARA.
       MOVE 2 TO num
       DISPLAY "First 50 prime numbers are: "
       PERFORM UNTIL NOT (num <= 50)
       MOVE 'Y' TO isPrime
       MOVE 2 TO i
       PERFORM UNTIL NOT (i <= num / 2)
       DIVIDE num BY i GIVING rem REMAINDER rem
       IF rem = 0
      * avoid using %
      * avoid using %
       MOVE 'N' TO isPrime
       EXIT PERFORM
       END-IF
       ADD 1 TO i
       END-PERFORM
       IF isPrime = 'Y'
       DISPLAY num
       END-IF
       ADD 1 TO num
       END-PERFORM
       EXIT.
       STOP RUN.

