       IDENTIFICATION DIVISION.
       PROGRAM-ID. Test.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_CALC_CLASS_TEST_GLOBAL
       01  x_calc          PIC S9(5).
       01  y_calc          PIC S9(5).
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_-ARRAY    .
           05  args         PIC X(10) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  a               PIC S9(5).
       01  b               PIC S9(5).


       PROCEDURE DIVISION.


       calc-PARA.
       DISPLAY "The values of x and y are:" x y
       EXIT.

       MAIN-PARA.
       MOVE 10 TO a
       MOVE 9 TO b
       MOVE a TO x
       MOVE b TO y
       PERFORM CALC-PARA
       EXIT.
       STOP RUN.

