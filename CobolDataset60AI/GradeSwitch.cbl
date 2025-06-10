       IDENTIFICATION DIVISION.
       PROGRAM-ID. GradeSwitch.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 GRADE        PIC X VALUE SPACE.

       PROCEDURE DIVISION.
           DISPLAY "Enter grade (A/B/C/D): " WITH NO ADVANCING.
           ACCEPT GRADE.

           EVALUATE GRADE
               WHEN "A"
                   DISPLAY "Excellent"
               WHEN "B"
                   DISPLAY "Good"
               WHEN "C"
                   DISPLAY "Average"
               WHEN "D"
                   DISPLAY "Poor"
               WHEN OTHER
                   DISPLAY "Invalid grade"
           END-EVALUATE.

           STOP RUN.
