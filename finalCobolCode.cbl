       IDENTIFICATION DIVISION.
       PROGRAM-ID. T06_Casting.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TESTSCOPED_GLOBAL
       01  args_main-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
       01  args_main-MAX   PIC S9(9) VALUE 100.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TESTSCOPED_GLOBAL
       01  d_main          PIC S9(9)V9(6).
       01  b_main          PIC S9(9)V9(6).
       01  x_main          PIC S9(9).
       01  a_main          PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 9.7 TO d_main
       COMPUTE x_main = FUNCTION INTEGER-PART(d_main)
       DISPLAY x_main
       MOVE 7 TO a_main
       MOVE a_main TO b_main
       DISPLAY b_main
       EXIT.


