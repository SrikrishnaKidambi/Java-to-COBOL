       IDENTIFICATION DIVISION.
       PROGRAM-ID. TESTCASE19.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 X        USAGE FLOAT-LONG VALUE 0.5.
       01 VAL      USAGE FLOAT-LONG.

       PROCEDURE DIVISION.
           IF X >= -1.0 AND X <= 1.0
               CALL "acos" USING BY VALUE X
                            RETURNING VAL
               DISPLAY "acos(" X ") = " VAL
           ELSE
               DISPLAY "Input out of range for acos"
           END-IF

           STOP RUN.
