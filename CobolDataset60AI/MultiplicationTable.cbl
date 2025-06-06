       IDENTIFICATION DIVISION.
       PROGRAM-ID. MULTIPLICATION-TABLE.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 NUM              PIC 99.
       01 I                PIC 99 VALUE 1.
       01 PRODUCT          PIC 999.
       01 TEMP-DISPLAY     PIC X(50).

       PROCEDURE DIVISION.
           DISPLAY "Enter number: " WITH NO ADVANCING.
           ACCEPT NUM.

           PERFORM UNTIL I > 10
               COMPUTE PRODUCT = NUM * I
               DISPLAY NUM " x " I " = " PRODUCT
               ADD 1 TO I
           END-PERFORM.

           STOP RUN.
