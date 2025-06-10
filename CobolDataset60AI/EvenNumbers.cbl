       IDENTIFICATION DIVISION.
       PROGRAM-ID. EvenNumbers.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 I          PIC 99 VALUE 2.

       PROCEDURE DIVISION.
           DISPLAY "Even numbers up to 20 are: ".

           PERFORM UNTIL I > 20
               DISPLAY I
               ADD 2 TO I
           END-PERFORM.

           STOP RUN.
