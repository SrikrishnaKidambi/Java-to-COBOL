       IDENTIFICATION DIVISION.
       PROGRAM-ID. Calculator.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TESTSCOPED_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TESTSCOPED_GLOBAL
       01  sc_main         PIC X(100).
       01  a_main          PIC S9(5).
       01  b_main          PIC S9(5).
       01  res_main        PIC S9(5).
       01  op_main         PIC X(1).



       MAIN-PARA.
      * Input from ODT is enabled
       DISPLAY "Enter first number: " WITH NO ADVANCING
       ACCEPT a_main
       DISPLAY "Enter second number: " WITH NO ADVANCING
       ACCEPT b_main
       DISPLAY "Enter operation (+, -, *, /): " WITH NO ADVANCING
       ACCEPT op_main
       IF op_main = '+'
       ADD a_main TO b_main GIVING res_main
       DISPLAY "Sum: "   res_main
       ELSE
       IF op_main = '-'
       SUBTRACT b_main FROM a_main GIVING res_main
       DISPLAY "Difference: "   res_main
       ELSE
       IF op_main = '*'
       MULTIPLY a_main BY b_main GIVING res_main
       DISPLAY "Product: "   res_main
       ELSE
       IF op_main = '/'
       IF b_main NOT= 0
       DIVIDE a_main BY b_main GIVING res_main
       DISPLAY "Quotient: "   res_main
       ELSE
       DISPLAY "Cannot divide by zero"
       END-IF.
       ELSE
       DISPLAY "Invalid operation"
       END-IF.
       END-IF.
       END-IF.
       END-IF.
       STOP RUN.

