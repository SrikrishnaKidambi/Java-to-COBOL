       IDENTIFICATION DIVISION.
       PROGRAM-ID. DivisibleByThree.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 I         PIC 99 VALUE 3.

       PROCEDURE DIVISION.
           DISPLAY "Multiples of 3 upto 30 are: ".

           PERFORM UNTIL I > 30
               DISPLAY I
               ADD 3 TO I
           END-PERFORM.

           STOP RUN.
