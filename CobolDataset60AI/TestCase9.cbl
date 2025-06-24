       IDENTIFICATION DIVISION.
       PROGRAM-ID. TESTCASE9.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 I             PIC 9     VALUE 0.
       01 PI            USAGE FLOAT-LONG VALUE 3.14.
       01 ANGLE         USAGE FLOAT-LONG VALUE 0.
       01 VAL           USAGE FLOAT-LONG VALUE 0.

       PROCEDURE DIVISION.
           PERFORM UNTIL I > 3
               COMPUTE ANGLE = I * (PI / 2)
               CALL "sin" USING BY VALUE ANGLE
                           RETURNING VAL

               DISPLAY "sin(" ANGLE ") = " VAL

               ADD 1 TO I
           END-PERFORM

           STOP RUN.
