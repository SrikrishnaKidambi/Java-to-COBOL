       IDENTIFICATION DIVISION.
       PROGRAM-ID. TESTCASE4.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 CH1         PIC X VALUE 'a'.
       01 CODE1       PIC 9(5) COMP-5.
       01 NAME1       PIC X(10) VALUE "java".
       01 UPPER-NAME PIC X(10).

       PROCEDURE DIVISION.
      * --- CodePointAt equivalent
           MOVE FUNCTION ORD(CH1) TO CODE1
           DISPLAY "CodePoint: " CODE1

      * --- toUpperCase equivalent
           MOVE FUNCTION UPPER-CASE(NAME1) TO UPPER-NAME
           DISPLAY "Uppercase: " UPPER-NAME

           STOP RUN.
