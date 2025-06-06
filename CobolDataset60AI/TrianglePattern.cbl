       IDENTIFICATION DIVISION.
       PROGRAM-ID. TRIANGLE-PATTERN.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ROWS        PIC 99.
       01 I           PIC 99 VALUE 1.
       01 J           PIC 99 VALUE 1.

       PROCEDURE DIVISION.
           DISPLAY "Enter number of rows: " WITH NO ADVANCING.
           ACCEPT ROWS.

           PERFORM VARYING I FROM 1 BY 1 UNTIL I > ROWS
               PERFORM VARYING J FROM 1 BY 1 UNTIL J > I
                   DISPLAY "* " WITH NO ADVANCING
               END-PERFORM
               DISPLAY " "
           END-PERFORM

           STOP RUN.
