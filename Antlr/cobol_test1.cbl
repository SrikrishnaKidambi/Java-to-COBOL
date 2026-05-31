       IDENTIFICATION DIVISION.
<<<<<<< HEAD
       PROGRAM-ID. TestString.
=======
       PROGRAM-ID. Test.
>>>>>>> d0101356c30f8ca04a5b8847da13c60c00a185d3


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TESTSCOPED_GLOBAL
<<<<<<< HEAD
       01  args_main-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
       01  args_main-MAX   PIC S9(9) VALUE 100.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TESTSCOPED_GLOBAL
       01  s_main          PIC X(100).
=======
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TESTSCOPED_GLOBAL
       01  a_main          PIC S9(5).
>>>>>>> d0101356c30f8ca04a5b8847da13c60c00a185d3
