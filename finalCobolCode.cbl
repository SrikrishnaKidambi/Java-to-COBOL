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
       01  op              PIC X(1).


       PROCEDURE DIVISION.


       MAIN-PARA.
<<<<<<< HEAD
       MOVE 50 TO value
       IF value  <  100
       ELSE
       DISPLAY "small"
=======
      * Input from ODT is enabled
       DISPLAY "Enter first number: " WITH NO ADVANCING
       ACCEPT a
       DISPLAY "Enter second number: " WITH NO ADVANCING
       ACCEPT b
       DISPLAY "Enter operation (+, -, *, /): " WITH NO ADVANCING
       ACCEPT op
       IF op  =  '+'
       ELSE
       IF op  =  '-'
       ELSE
       IF op  =  '*'
       ELSE
       IF op  =  '/'
       ELSE
       DISPLAY "Sum: "   (a + b)
       IF op  =  '-'
       ELSE
       IF op  =  '*'
       ELSE
       IF op  =  '/'
       ELSE
       DISPLAY "Difference: "   (a - b)
       IF op  =  '*'
       ELSE
       IF op  =  '/'
       ELSE
       DISPLAY "Product: "   (a * b)
       IF op  =  '/'
       ELSE
       IF b  NOT =  0
       ELSE
       DISPLAY "Quotient: "   ((double) a / b)
       DISPLAY "Cannot divide by zero"
       DISPLAY "Invalid operation"
>>>>>>> dff6a2b75b1bf6e5676ccd3ef1c60ef006dbab2b
       EXIT.
       STOP RUN.

