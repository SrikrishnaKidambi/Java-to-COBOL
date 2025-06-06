       IDENTIFICATION DIVISION.
       PROGRAM-ID. DigitCounter.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 NUM             PIC 9(10) VALUE 0.
       01 COUNT1           PIC 9       VALUE 0.
       01 TEMP-NUM        PIC 9(10).

       PROCEDURE DIVISION.
           DISPLAY "Enter number: " WITH NO ADVANCING.
           ACCEPT NUM.
           MOVE NUM TO TEMP-NUM.

           PERFORM UNTIL TEMP-NUM = 0
               ADD 1 TO COUNT1
               DIVIDE TEMP-NUM BY 10 GIVING TEMP-NUM
           END-PERFORM.

           DISPLAY "Number of digits: " COUNT1.

           STOP RUN.
