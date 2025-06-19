       IDENTIFICATION DIVISION.
       PROGRAM-ID. TESTCASE2.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 RAND-VALUE      USAGE FLOAT-LONG.
       01 SQRT-VAL        USAGE FLOAT-LONG.
       01 CONST-25        USAGE FLOAT-LONG VALUE 25.0.
       01 SEED            USAGE BINARY-LONG VALUE 0.

       PROCEDURE DIVISION.
           CALL "CBL_RAND" USING SEED RETURNING RAND-VALUE

           CALL "sqrt" USING BY VALUE CONST-25
                        RETURNING SQRT-VAL

           DISPLAY "Random: " RAND-VALUE

           IF SQRT-VAL = 5.0
               DISPLAY "Sqrt works correctly!"
           END-IF

           STOP RUN.
