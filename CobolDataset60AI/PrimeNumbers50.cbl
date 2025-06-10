       IDENTIFICATION DIVISION.
       PROGRAM-ID. PRIME-NUMBERS-50.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 NUM           PIC 99 VALUE 2.
       01 I             PIC 99.
       01 QUOTIENT      PIC 99.
       01 PRODUCT       PIC 99.
       01 IS-PRIME      PIC X VALUE 'Y'.

       PROCEDURE DIVISION.
           DISPLAY "First 50 prime numbers are:"

           PERFORM UNTIL NUM > 50
               MOVE 'Y' TO IS-PRIME
               MOVE 2 TO I

               PERFORM UNTIL I > NUM / 2
                   COMPUTE QUOTIENT = NUM / I
                   COMPUTE PRODUCT = QUOTIENT * I
                   IF PRODUCT = NUM
                       MOVE 'N' TO IS-PRIME
                       EXIT PERFORM
                   END-IF
                   ADD 1 TO I
               END-PERFORM

               IF IS-PRIME = 'Y'
                   DISPLAY NUM
               END-IF

               ADD 1 TO NUM
           END-PERFORM.

           STOP RUN.
