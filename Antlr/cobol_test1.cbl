       IDENTIFICATION DIVISION.
       PROGRAM-ID. cobol_test1.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_ADD_CLASS_TEST_METHOD_GLOBAL
       01  X               PIC 9(5).
       01  Y               PIC 9(5).
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_METHOD_GLOBAL
       01  ARGS_-ARRAY    .
           05  ARGS         PIC X(10) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TEST_METHOD_GLOBAL
       01  X               PIC 9(5).
       01  Y               PIC 9(5).
       01  RES             PIC 9(5).
