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
