       IDENTIFICATION DIVISION.
       PROGRAM-ID. TESTCASE18.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 D           USAGE FLOAT-LONG VALUE -1.0.
       01 VAL         USAGE FLOAT-LONG.
       01 STEP        USAGE FLOAT-LONG VALUE 0.5.

       PROCEDURE DIVISION.
           PERFORM UNTIL D > 1.0
               CALL "asin" USING BY VALUE D
                            RETURNING VAL

               DISPLAY "asin(" D ") = " VAL

               COMPUTE D = D + STEP
           END-PERFORM

           STOP RUN.
