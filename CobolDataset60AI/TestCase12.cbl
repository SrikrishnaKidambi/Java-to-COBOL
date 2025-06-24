       IDENTIFICATION DIVISION.
       PROGRAM-ID. TESTCASE12.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 I            PIC 9 VALUE 1.
       01 VAL-IN       USAGE FLOAT-LONG.
       01 LOG10-VAL    USAGE FLOAT-LONG.

       PROCEDURE DIVISION.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 4
               COMPUTE VAL-IN = FUNCTION FLOAT(I)

               CALL "log10" USING BY VALUE VAL-IN
                             RETURNING LOG10-VAL

               DISPLAY "Log base 10 of " I " is " LOG10-VAL
           END-PERFORM

           STOP RUN.
