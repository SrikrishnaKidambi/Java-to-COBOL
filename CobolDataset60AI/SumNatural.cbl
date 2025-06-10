       IDENTIFICATION DIVISION.
       PROGRAM-ID. SUM-NATURAL.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N             PIC 999.
       01 I             PIC 999 VALUE 1.
       01 SUM1           PIC 99999 VALUE 0.

       PROCEDURE DIVISION.
           DISPLAY "Enter N: " WITH NO ADVANCING.
           ACCEPT N.

           PERFORM UNTIL I > N
               ADD I TO SUM1
               ADD 1 TO I
           END-PERFORM

           DISPLAY "Sum = " SUM1.

           STOP RUN.
