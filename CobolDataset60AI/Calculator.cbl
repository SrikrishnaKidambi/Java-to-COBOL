       IDENTIFICATION DIVISION.
       PROGRAM-ID. Calculator.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 A               PIC S9(5) VALUE 0.
       01 B               PIC S9(5) VALUE 0.
       01 OPERATOR        PIC X.
       01 RESULT-NUMERIC  PIC S9(10)V9(5).
       01 RESULT-MSG      PIC X(30).

       PROCEDURE DIVISION.
           DISPLAY "Enter first number: " WITH NO ADVANCING.
           ACCEPT A.

           DISPLAY "Enter second number: " WITH NO ADVANCING.
           ACCEPT B.

           DISPLAY "Enter operation (+, -, *, /): " WITH NO ADVANCING.
           ACCEPT OPERATOR.

           EVALUATE OPERATOR
               WHEN "+"
                   COMPUTE RESULT-NUMERIC = A + B
                   DISPLAY "Sum: " RESULT-NUMERIC
               WHEN "-"
                   COMPUTE RESULT-NUMERIC = A - B
                   DISPLAY "Difference: " RESULT-NUMERIC
               WHEN "*"
                   COMPUTE RESULT-NUMERIC = A * B
                   DISPLAY "Product: " RESULT-NUMERIC
               WHEN "/"
                   IF B NOT = 0 THEN
                       COMPUTE RESULT-NUMERIC = A / B
                       DISPLAY "Quotient: " RESULT-NUMERIC
                   ELSE
                       DISPLAY "Cannot divide by zero"
                   END-IF
               WHEN OTHER
                   DISPLAY "Invalid operation"
           END-EVALUATE.

           STOP RUN.
