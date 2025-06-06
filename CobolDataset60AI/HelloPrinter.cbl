       IDENTIFICATION DIVISION.
       PROGRAM-ID. HelloPrinter.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 I         PIC 9(1) VALUE 1.

       PROCEDURE DIVISION.
           PERFORM PRINT-HELLO.
           STOP RUN.

       PRINT-HELLO.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 5
               DISPLAY "Hello"
           END-PERFORM.
           EXIT.
