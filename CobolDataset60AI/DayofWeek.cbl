       IDENTIFICATION DIVISION.
       PROGRAM-ID. DayOfWeek.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 DAY-NUMBER        PIC 9.
       01 DAY-NAME          PIC X(10).

       PROCEDURE DIVISION.
           DISPLAY "Enter day number (1-7): " WITH NO ADVANCING.
           ACCEPT DAY-NUMBER.

           EVALUATE DAY-NUMBER
               WHEN 1
                   MOVE "Monday" TO DAY-NAME
               WHEN 2
                   MOVE "Tuesday" TO DAY-NAME
               WHEN 3
                   MOVE "Wednesday" TO DAY-NAME
               WHEN 4
                   MOVE "Thursday" TO DAY-NAME
               WHEN 5
                   MOVE "Friday" TO DAY-NAME
               WHEN 6
                   MOVE "Saturday" TO DAY-NAME
               WHEN 7
                   MOVE "Sunday" TO DAY-NAME
               WHEN OTHER
                   MOVE "Invalid" TO DAY-NAME
           END-EVALUATE.

           DISPLAY "Day: " DAY-NAME.

           STOP RUN.
