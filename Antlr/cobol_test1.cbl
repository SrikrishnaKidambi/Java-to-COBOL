       IDENTIFICATION DIVISION.
       PROGRAM-ID. TestCase17.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:BLOCK_METHOD_CHECKSIGN_CLASS_TESTSCOPED_GLOBAL
       01  num_checkSign   PIC S9(5).
       01  sign_checkSign  PIC S9(5)V9(2).
      * Variables for Scope:METHOD_MAIN_CLASS_TESTSCOPED_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
