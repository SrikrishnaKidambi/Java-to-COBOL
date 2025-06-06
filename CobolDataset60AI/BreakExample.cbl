       IDENTIFICATION DIVISION.
       PROGRAM-ID. BREAK-EXAMPLE.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 I         PIC 999 VALUE 1.
       01 REM1      PIC 9.
       01 REM2      PIC 9.
       01 FOUND     PIC X VALUE "N".

       PROCEDURE DIVISION.
           PERFORM UNTIL I > 100 OR FOUND = "Y"
               COMPUTE REM1 = FUNCTION MOD(I, 3)
               COMPUTE REM2 = FUNCTION MOD(I, 7)

               IF REM1 = 0 AND REM2 = 0 THEN
                   DISPLAY "First number divisible by both 3 and 7 is: "
                    I
                   MOVE "Y" TO FOUND
               ELSE
                   ADD 1 TO I
               END-IF
           END-PERFORM

           STOP RUN.
