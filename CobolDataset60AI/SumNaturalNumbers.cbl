       IDENTIFICATION DIVISION.
       PROGRAM-ID. SUM-FIRST-10.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 I             PIC 99 VALUE 1.
       01 SUM1           PIC 999 VALUE 0.

       PROCEDURE DIVISION.
           PERFORM SUM-FIRST-10
           STOP RUN.

       SUM-FIRST-10.
           PERFORM UNTIL I > 10
               ADD I TO SUM1
               ADD 1 TO I
           END-PERFORM
           DISPLAY "Sum = " SUM1.
           EXIT.
