       IDENTIFICATION DIVISION.
       PROGRAM-ID. TESTCASE14.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 LANG          PIC X(10) VALUE "java".
       01 UPPER         PIC X(10).
       01 COMPARE-VALUE PIC X(10) VALUE "JAVA".

       PROCEDURE DIVISION.
           MOVE FUNCTION UPPER-CASE(LANG) TO UPPER

           EVALUATE TRUE
               WHEN UPPER = COMPARE-VALUE
                   DISPLAY "Language is JAVA"
               WHEN OTHER
                   DISPLAY "Unknown language"
           END-EVALUATE

           STOP RUN.
