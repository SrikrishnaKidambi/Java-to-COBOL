       IDENTIFICATION DIVISION.
       PROGRAM-ID. PRIME-NUMBERS.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N             PIC 999.
       01 I             PIC 999 VALUE 2.
       01 J             PIC 999.
       01 REM           PIC 999.
       01 IS-PRIME      PIC X VALUE 'Y'.

       PROCEDURE DIVISION.
           DISPLAY "Find primes up to: " WITH NO ADVANCING.
           ACCEPT N.

           PERFORM UNTIL I > N
               MOVE 'Y' TO IS-PRIME
               MOVE 2 TO J

               PERFORM UNTIL J > I / 2
                   COMPUTE REM = FUNCTION MOD(I, J)
                   IF REM = 0
                       MOVE 'N' TO IS-PRIME
                       EXIT PERFORM
                   END-IF
                   ADD 1 TO J
               END-PERFORM

               IF IS-PRIME = 'Y'
                   DISPLAY I " is prime"
               END-IF

               ADD 1 TO I
           END-PERFORM.

           STOP RUN.
