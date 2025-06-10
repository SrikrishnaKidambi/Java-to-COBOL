       IDENTIFICATION DIVISION.
       PROGRAM-ID. EvenOdd.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 NUM        PIC S9(5) VALUE 0.
       01 REM        PIC 9 VALUE 0.

       PROCEDURE DIVISION.
           DISPLAY "Enter a number: " WITH NO ADVANCING.
           ACCEPT NUM.

           COMPUTE REM = FUNCTION MOD(NUM, 2).

           IF REM = 0 THEN
               DISPLAY "Even number"
           ELSE
               DISPLAY "Odd number"
           END-IF.

           STOP RUN.
