       IDENTIFICATION DIVISION.
       PROGRAM-ID. Test36.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_SUMARRAY_CLASS_TESTSCOPED_GLOBAL
       01  ARR_SUMARRAY_-ARRAY.
           05  arr_sumArray PIC S9(5) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_SUMARRAY_CLASS_TESTSCOPED_GLOBAL
       01  sum_sumArray    PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_SUMARRAY_CLASS_TESTSCOPED_GLOBAL
       01  i_sumArray      PIC S9(5).
      * Variables for Scope:METHOD_MAIN_CLASS_TESTSCOPED_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TESTSCOPED_GLOBAL
       01  arr_main-ARRAY .
           05  arr_main     PIC S9(5) OCCURS 10 TIMES.
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_TESTSCOPED_GLOBAL
       01  i_main          PIC S9(5).
