       IDENTIFICATION DIVISION.
       PROGRAM-ID. Test41.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_CHAINCONDITION_CLASS_TESTSCOPED_GLOBAL
       01  a_chainCondition PIC S9(5).
       01  b_chainCondition PIC S9(5).
       01  c_chainCondition PIC S9(5).
      * Variables for Scope:METHOD_MAIN_CLASS_TESTSCOPED_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
