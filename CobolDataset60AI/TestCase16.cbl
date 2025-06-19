       IDENTIFICATION DIVISION.
       PROGRAM-ID. TESTCASE16.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 BASE        USAGE FLOAT-LONG VALUE 2.0.
       01 EXP-VALUE   USAGE FLOAT-LONG.

       PROCEDURE DIVISION.
           IF BASE = 2.0
               CALL "exp" USING BY VALUE BASE
                           RETURNING EXP-VALUE
               DISPLAY "e^" BASE " = " EXP-VALUE
           END-IF

           STOP RUN.
