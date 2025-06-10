       IDENTIFICATION DIVISION.
       PROGRAM-ID. MenuDisplay.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 CHOICE      PIC 9 VALUE 0.

       PROCEDURE DIVISION.
           PERFORM SHOW-MENU.
           STOP RUN.

       SHOW-MENU.
           DISPLAY "1. Start".
           DISPLAY "2. Settings".
           DISPLAY "3. Exit".
           DISPLAY "Enter your choice: " WITH NO ADVANCING.
           ACCEPT CHOICE.

           EVALUATE CHOICE
               WHEN 1
                   DISPLAY "Starting..."
               WHEN 2
                   DISPLAY "Opening Settings..."
               WHEN 3
                   DISPLAY "Exiting..."
               WHEN OTHER
                   DISPLAY "Invalid Choice"
           END-EVALUATE.
