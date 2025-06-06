       IDENTIFICATION DIVISION.
       PROGRAM-ID. PrimeNumbers.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_-ARRAY    .
           05  args         PIC X(10) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  sc              PIC X(10).
       01  n               PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  i               PIC S9(5).
      * Variables for Scope:BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  isPrime         PIC X(1).
      * Variables for Scope:FOR_BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  j               PIC S9(5).
      * Variables for Scope:BLOCK_FOR_BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  rem             PIC S9(5).


       PROCEDURE DIVISION.


       MAIN-PARA.
      * Input from ODT is enabled
       DISPLAY "Find primes up to: " WITH NO ADVANCING
       ACCEPT n
       PERFORM VARYING i FROM 2 BY 1 UNTIL NOT (i <= n)
       MOVE 'Y' TO isPrime
       PERFORM VARYING j FROM 2 BY 1 UNTIL NOT (j <= i / 2)
       DIVIDE i BY j GIVING rem REMAINDER rem
       IF rem = 0
       MOVE 'N' TO isPrime
       EXIT PERFORM
       END-IF
       END-PERFORM
       
       IF isPrime = 'Y'
       DISPLAY i   " is prime"
       END-IF
       END-PERFORM.
       EXIT.
       STOP RUN.

