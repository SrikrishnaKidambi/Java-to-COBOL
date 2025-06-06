       IDENTIFICATION DIVISION.
       PROGRAM-ID. MENU-NESTED-SWITCH.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 USER-CHOICE          PIC 9.
       01 SUBCHOICE            PIC 9.

       PROCEDURE DIVISION.
           DISPLAY "Main Menu:".
           DISPLAY "1. File".
           DISPLAY "2. Edit".
           DISPLAY "Enter your choice: " WITH NO ADVANCING.
           ACCEPT USER-CHOICE.

           EVALUATE USER-CHOICE
               WHEN 1
                   DISPLAY "File Menu:" 
                   DISPLAY "1. New"
                   DISPLAY "2. Open"
                   ACCEPT SUBCHOICE
                   EVALUATE SUBCHOICE
                       WHEN 1
                           DISPLAY "New File Created"
                       WHEN 2
                           DISPLAY "File Opened"
                       WHEN OTHER
                           DISPLAY "Invalid file menu option"
                   END-EVALUATE

               WHEN 2
                   DISPLAY "Edit Menu:" 
                   DISPLAY "1. Cut"
                   DISPLAY "2. Paste"
                   ACCEPT SUBCHOICE
                   EVALUATE SUBCHOICE
                       WHEN 1
                           DISPLAY "Cut executed"
                       WHEN 2
                           DISPLAY "Paste executed"
                       WHEN OTHER
                           DISPLAY "Invalid edit menu option"
                   END-EVALUATE

               WHEN OTHER
                   DISPLAY "Invalid main menu choice"
           END-EVALUATE.

           STOP RUN.
