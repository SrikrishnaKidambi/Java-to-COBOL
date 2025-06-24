       IDENTIFICATION DIVISION.
       PROGRAM-ID. TESTCASE20.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 A        PIC S9(4) COMP-5 VALUE 15.
       01 B        PIC S9(4) COMP-5 VALUE 20.
       01 MIN      PIC S9(4) COMP-5.

       PROCEDURE DIVISION.
      * -- Determine the minimum value
           IF A < B
               MOVE A TO MIN
           ELSE
               MOVE B TO MIN
           END-IF

      * -- Simulate switch-case using EVALUATE
           EVALUATE MIN
               WHEN 15
                   DISPLAY "Minimum is 15"
               WHEN 20
                   DISPLAY "Minimum is 20"
               WHEN OTHER
                   DISPLAY "Unexpected minimum"
           END-EVALUATE

           STOP RUN.
