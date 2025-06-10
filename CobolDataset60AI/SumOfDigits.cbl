       IDENTIFICATION DIVISION.
       PROGRAM-ID. SUM-OF-DIGITS.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 NUM             PIC 9(5).
       01 REM             PIC 9.
       01 SUM1             PIC 9(5) VALUE 0.

       PROCEDURE DIVISION.
           DISPLAY "Enter a number: " WITH NO ADVANCING.
           ACCEPT NUM.

           PERFORM UNTIL NUM = 0
               COMPUTE REM = FUNCTION MOD(NUM, 10)
               ADD REM TO SUM1
               COMPUTE NUM = NUM / 10
           END-PERFORM

           DISPLAY "Sum of digits: " SUM1.

           STOP RUN.
