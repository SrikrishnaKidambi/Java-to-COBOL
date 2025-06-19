       IDENTIFICATION DIVISION.
       PROGRAM-ID. TESTCASE8.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 A        PIC 9 VALUE 7.
       01 B        PIC 9 VALUE 3.
       01 MAX      PIC 9.

       PROCEDURE DIVISION.
           IF A > B
               MOVE A TO MAX
           ELSE
               MOVE B TO MAX
           END-IF

           EVALUATE MAX
               WHEN 7
                   DISPLAY "Maximum is 7"
               WHEN 3
                   DISPLAY "Maximum is 3"
               WHEN OTHER
                   DISPLAY "Unexpected value"
           END-EVALUATE

           STOP RUN.
