       IDENTIFICATION DIVISION.
<<<<<<< HEAD
       PROGRAM-ID. TestArgsExpr.
=======
       PROGRAM-ID. Test.
>>>>>>> fa3c8b3a9fd6aaef27227d5625d1c6218356bd63


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_CHECK_CLASS_TESTSCOPED_GLOBAL
       01  x_check         PIC S9(5).
      * Variables for Scope:METHOD_MAIN_CLASS_TESTSCOPED_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TESTSCOPED_GLOBAL
       01  p_main          PIC S9(5).
       01  q_main          PIC S9(5).
       01  r_main          PIC S9(5).
