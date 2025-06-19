       IDENTIFICATION DIVISION.
       PROGRAM-ID. TESTCASE7.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 I              PIC 9 COMP-5 VALUE 1.
       01 ROOT           USAGE FLOAT-LONG.
       01 DISPLAY-TEXT   PIC X(50).

       PROCEDURE DIVISION.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 5
               CALL "sqrt" USING BY VALUE FUNCTION FLOAT(I)
                             RETURNING ROOT

               DISPLAY "Square root of " I " is " ROOT
           END-PERFORM

           STOP RUN.
