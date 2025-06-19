       IDENTIFICATION DIVISION.
       PROGRAM-ID. TESTCASE17.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 NUM         PIC S9(5) COMP-5 VALUE -25.
       01 SIGN1        PIC S9(1) COMP-5.

       PROCEDURE DIVISION.
      * -- Simulate Math.signum()
           IF NUM > 0
               MOVE 1 TO SIGN1
           ELSE IF NUM < 0
               MOVE -1 TO SIGN1
           ELSE
               MOVE 0 TO SIGN1
           END-IF

      * -- Check the sign
           IF SIGN1 > 0
               DISPLAY "Number is positive"
           ELSE IF SIGN1 < 0
               DISPLAY "Number is negative"
           ELSE
               DISPLAY "Number is zero"
           END-IF

           STOP RUN.
