       IDENTIFICATION DIVISION.
       PROGRAM-ID. STRING-JOINER.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 FIRST-NAME       PIC X(20).
       01 LAST-NAME        PIC X(20).
       01 FULL-NAME        PIC X(50).

       PROCEDURE DIVISION.
           DISPLAY "Enter first name: " WITH NO ADVANCING.
           ACCEPT FIRST-NAME.
           DISPLAY "Enter last name: " WITH NO ADVANCING.
           ACCEPT LAST-NAME.

           STRING
               FIRST-NAME   DELIMITED BY SPACE
               " "          DELIMITED BY SIZE
               LAST-NAME    DELIMITED BY SPACE
               INTO FULL-NAME
           END-STRING.

           DISPLAY "Full name: " FULL-NAME.

           STOP RUN.
