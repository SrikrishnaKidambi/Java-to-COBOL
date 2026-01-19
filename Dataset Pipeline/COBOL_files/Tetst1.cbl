       IDENTIFICATION DIVISION.
       PROGRAM-ID. Test1.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:BLOCK_METHOD_CALC_CLASS_TEST_GLOBAL
       01  a               PIC S9(5).
       01  b               PIC S9(5).
       01  sum_1            PIC S9(5).
       01  diff            PIC S9(5).
       01  prod            PIC S9(5).
       01  quot            PIC S9(5).
       01  rem             PIC S9(5).
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_-ARRAY    .
           05  args         PIC X(10) OCCURS 100 TIMES.


       PROCEDURE DIVISION.


       calc-PARA.
           ADD a TO b GIVING sum_1
           SUBTRACT b FROM a GIVING diff
           MULTIPLY a BY b GIVING prod
           DIVIDE a BY b GIVING quot
           DIVIDE a BY b GIVING rem REMAINDER rem
           DISPLAY sum_1
           DISPLAY diff
           DISPLAY prod
           DISPLAY quot
           DISPLAY rem
           EXIT.

       MAIN-PARA.
           PERFORM CALC-PARA
           EXIT.
           STOP RUN.

