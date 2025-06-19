       IDENTIFICATION DIVISION.
       PROGRAM-ID. TESTCASE11.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 X           USAGE FLOAT-LONG VALUE 10.0.
       01 LOG-X       USAGE FLOAT-LONG.

       PROCEDURE DIVISION.
           IF X > 0
               CALL "log" USING BY VALUE X
                           RETURNING LOG-X
               DISPLAY "Natural log of " X " is " LOG-X
           ELSE
               DISPLAY "Log undefined for non-positive numbers"
           END-IF

           STOP RUN.
