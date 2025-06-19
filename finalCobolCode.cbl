       IDENTIFICATION DIVISION.
       PROGRAM-ID. PrimeNumbers.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  sc_main         PIC X(100).
       01  n_main          PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  i_main          PIC S9(5).
      * Variables for Scope:BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  isPrime_main    PIC X(1).
      * Variables for Scope:FOR_BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  j_main          PIC S9(5).
      * Variables for Scope:BLOCK_FOR_BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  rem_main        PIC S9(5).


       PROCEDURE DIVISION.


       MAIN-PARA.
      * Input from ODT is enabled
       DISPLAY "Find primes up to: " WITH NO ADVANCING
       ACCEPT n_main
       PERFORM VARYING i_main FROM 2 BY 1 UNTIL NOT (i_main <= n_main)
       MOVE 'Y' TO isPrime_main
       PERFORM VARYING j_main FROM 2 BY 1 UNTIL NOT (j_main <= i_main / 2)
       DIVIDE i_main BY j_main GIVING rem_main REMAINDER rem_main
       IF rem_main = 0
       MOVE 'N' TO isPrime_main
       EXIT PERFORM
       END-IF.
       END-PERFORM.
       IF isPrime_main
       DISPLAY i_main   " is prime"
       END-IF.
       END-PERFORM.
       EXIT.
       STOP RUN.

