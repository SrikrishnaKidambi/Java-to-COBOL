       IDENTIFICATION DIVISION.
       PROGRAM-ID. Calculator.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_-ARRAY    .
           05  args         PIC X(10) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  sc              PIC X(10).
       01  a               PIC S9(5).
       01  b               PIC S9(5).
       01  res             PIC S9(5).
       01  op              PIC X(1).


       PROCEDURE DIVISION.


       MAIN-PARA.
      * Input from ODT is enabled
       DISPLAY "Enter first number: " WITH NO ADVANCING
       ACCEPT a
       DISPLAY "Enter second number: " WITH NO ADVANCING
       ACCEPT b
       DISPLAY "Enter operation (+, -, *, /): " WITH NO ADVANCING
       ACCEPT op
       IF op = '+'
       ADD a TO b GIVING res
       DISPLAY "Sum: "   res
       ELSE
       IF op = '-'
       SUBTRACT b FROM a GIVING res
       DISPLAY "Difference: "   res
       ELSE
       IF op = '*'
       MULTIPLY a BY b GIVING res
       DISPLAY "Product: "   res
       ELSE
       IF op = '/'
       IF b NOT= 0
       DIVIDE a BY b GIVING res
       DISPLAY "Quotient: "   res
       ELSE
       DISPLAY "Cannot divide by zero"
       END-IF
       ELSE
       DISPLAY "Invalid operation"
       END-IF
       END-IF
       END-IF
       END-IF
       EXIT.
       STOP RUN.

