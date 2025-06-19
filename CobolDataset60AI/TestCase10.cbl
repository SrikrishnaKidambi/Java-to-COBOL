       IDENTIFICATION DIVISION.
       PROGRAM-ID. TESTCASE10.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 RAND-VALUE     USAGE FLOAT-LONG.
       01 SEED           USAGE BINARY-LONG VALUE 0.

       PROCEDURE DIVISION.
           CALL "CBL_RAND" USING SEED RETURNING RAND-VALUE

           IF RAND-VALUE < 0.5
               DISPLAY "Random value " RAND-VALUE " is less than 0.5"
           ELSE
               DISPLAY "Random value " RAND-VALUE " is 0.5 or more"
           END-IF

           STOP RUN.
