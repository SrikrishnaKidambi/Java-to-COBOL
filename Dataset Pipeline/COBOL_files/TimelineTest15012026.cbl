       IDENTIFICATION DIVISION.
       PROGRAM-ID. PrintExprTest.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TESTSCOPED_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TESTSCOPED_GLOBAL
       01  a_main          PIC S9(5).
       01  b_main          PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 10 TO a_main
       MOVE 5 TO b_main
       DISPLAY a_main   b_main
       DISPLAY a_main * b_main - 3
       DISPLAY (a_main + b_main) * (a_main - b_main)
       DISPLAY a_main / b_main   2 * 3
       EXIT.


