       IDENTIFICATION DIVISION.
       PROGRAM-ID. TestCase20.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:BLOCK_METHOD_DISPLAYMINIMUMCATEGORY_CLASS_TEST_GLOBAL
       01  a_displayMinimumCategory PIC S9(5).
       01  b_displayMinimumCategory PIC S9(5).
       01  min_displayMinimumCategory PIC S9(5).
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
