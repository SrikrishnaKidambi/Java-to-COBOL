       IDENTIFICATION DIVISION.
       PROGRAM-ID. Test39.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_NESTEDLOOP_CLASS_TESTSCOPED_GLOBAL
       01  a_nestedLoop    PIC S9(5).
       01  b_nestedLoop    PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_NESTEDLOOP_CLASS_TESTSCOPED_GLOBAL
       01  i_nestedLoop    PIC S9(5).
      * Variables for Scope:FOR_BLOCK_FOR_BLOCK_METHOD_NESTEDLOOP_CLASS_TESTSCOPED_GLOBAL
       01  j_nestedLoop    PIC S9(5).
      * Variables for Scope:METHOD_MAIN_CLASS_TESTSCOPED_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
