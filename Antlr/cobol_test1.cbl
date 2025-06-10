       IDENTIFICATION DIVISION.
       PROGRAM-ID. TestScoped.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_CALC_CLASS_TEST_GLOBAL
       01  x_calc          PIC S9(5).
       01  y_calc          PIC S9(5).
      * Variables for Scope:BLOCK_METHOD_CALC_CLASS_TEST_GLOBAL
       01  z_calc          PIC S9(5).
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  x_main          PIC S9(5).
       01  y_main          PIC S9(5).
