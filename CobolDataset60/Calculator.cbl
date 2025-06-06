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
      * Input from ODT is enabled
       DISPLAY "Enter first number: "
       ACCEPT a
       DISPLAY "Enter second number: "
       ACCEPT b
       DISPLAY "Enter operation (+, -, *, /): "
       COMPUTE if (op = = FUNCTION ORD('+')) {
            System.out.println("Sum: " + (a + b))
        } else if (FUNCTION ORD(op) == FUNCTION ORD('-')) {
            System.out.println("Difference: " + (a - b))
        } else if (FUNCTION ORD(op) == FUNCTION ORD('*')) {
            System.out.println("Product: " + (a * b))
        } else if (FUNCTION ORD(op) == FUNCTION ORD('/')) {
            if (b != 0) {
                System.out.println("Quotient: " + ((double) a / b))
            } else {
                System.out.println("Cannot divide by zero")
            }
        } else {
            System.out.println("Invalid operation")
        }
       IF op  =  '+'
       ELSE
       IF op  =  '-'
       ELSE
       IF op  =  '*'
       ELSE
       IF op  =  '/'
       ELSE
       DISPLAY "Sum: "   (a + b)
       COMPUTE if (op = = FUNCTION ORD('-')) {
            System.out.println("Difference: " + (a - b))
        } else if (FUNCTION ORD(op) == FUNCTION ORD('*')) {
            System.out.println("Product: " + (a * b))
        } else if (FUNCTION ORD(op) == FUNCTION ORD('/')) {
            if (b != 0) {
                System.out.println("Quotient: " + ((double) a / b))
            } else {
                System.out.println("Cannot divide by zero")
            }
        } else {
            System.out.println("Invalid operation")
        }
       IF op  =  '-'
       ELSE
       IF op  =  '*'
       ELSE
       IF op  =  '/'
       ELSE
       DISPLAY "Difference: "   (a - b)
       COMPUTE if (op = = FUNCTION ORD('*')) {
            System.out.println("Product: " + (a * b))
        } else if (FUNCTION ORD(op) == FUNCTION ORD('/')) {
            if (b != 0) {
                System.out.println("Quotient: " + ((double) a / b))
            } else {
                System.out.println("Cannot divide by zero")
            }
        } else {
            System.out.println("Invalid operation")
        }
       IF op  =  '*'
       ELSE
       IF op  =  '/'
       ELSE
       DISPLAY "Product: "   (a * b)
       COMPUTE if (op = = FUNCTION ORD('/')) {
            if (b != 0) {
                System.out.println("Quotient: " + ((double) a / b))
            } else {
                System.out.println("Cannot divide by zero")
            }
        } else {
            System.out.println("Invalid operation")
        }
       IF op  =  '/'
       ELSE
       IF b  NOT =  0
       ELSE
       DISPLAY "Quotient: "   ((double) a / b)
       DISPLAY "Cannot divide by zero"
       DISPLAY "Invalid operation"
       EXIT.
       STOP RUN.

