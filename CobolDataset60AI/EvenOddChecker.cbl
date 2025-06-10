       IDENTIFICATION DIVISION.
       PROGRAM-ID. EvenOddChecker.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N           PIC S9(5) VALUE 0.
       01 REM         PIC 9 VALUE 0.

       PROCEDURE DIVISION.
           PERFORM CHECK-EVEN-ODD.
           STOP RUN.

       CHECK-EVEN-ODD.
           DISPLAY "Enter a number: " WITH NO ADVANCING.
           ACCEPT N.

           COMPUTE REM = FUNCTION MOD(N, 2).

           IF REM = 0 THEN
               DISPLAY "Even"
           ELSE
               DISPLAY "Odd"
           END-IF.
           EXIT.
