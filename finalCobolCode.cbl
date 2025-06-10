       IDENTIFICATION DIVISION.
       PROGRAM-ID. TestCase5.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_CALC_CLASS_TEST_GLOBAL
       01  x_calc          PIC S9(5).
       01  y_calc          PIC S9(5).
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_-ARRAY    .
           05  args         PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  a               PIC S9(5).
       01  b               PIC S9(5).
       01  maxChar         PIC X(1).
       01  minChar         PIC X(1).


       PROCEDURE DIVISION.


       calc-PARA.
       DISPLAY "The values of x and y are:" x y
       EXIT.

       MAIN-PARA.
<<<<<<< HEAD
       MOVE 10 TO a
       MOVE 9 TO b
       MOVE a TO x
       MOVE b TO y
       PERFORM CALC-PARA
=======
       MOVE FUNCTION CHAR(FUNCTION ORD-MAX("A" "b" "Z" "x")) TO maxChar
       MOVE FUNCTION CHAR(FUNCTION ORD-MIN("A" "b" "Z" "x")) TO minChar
       DISPLAY "Max char: "   maxChar
      * x
      * x
       DISPLAY "Min char: "   minChar
>>>>>>> 1013fa4012e708dbc3e94f5c1be5af279c02cb6f
       EXIT.
       STOP RUN.

