       IDENTIFICATION DIVISION.
       PROGRAM-ID. TESTCASE6.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 VALUE-IN     PIC S9(5) COMP-5.   *> Signed integer input
       01 ABS-VALUE    PIC 9(5).

       PROCEDURE DIVISION.
           DISPLAY "Enter an integer:"
           ACCEPT VALUE-IN

           IF VALUE-IN < 0
               COMPUTE ABS-VALUE = VALUE-IN * -1
               DISPLAY "Absolute Value: " ABS-VALUE
           ELSE
               DISPLAY "Value is already positive: " VALUE-IN
           END-IF

           STOP RUN.
