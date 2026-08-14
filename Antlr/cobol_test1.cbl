       IDENTIFICATION DIVISION.
       PROGRAM-ID. Dog.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:CLASS_TESTSCOPED_GLOBAL
       01  name            PIC X(100).
       01  age             PIC X(100).
      * Variables for Scope:METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  args_main-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
       01  args_main-MAX   PIC S9(9) VALUE 100.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  d_main          PIC X(100).
