       IDENTIFICATION DIVISION.
       PROGRAM-ID. SENTENCE-CREATOR.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 COLOR1         PIC X(20).
       01 ANIMAL        PIC X(20).
       01 SENTENCE1      PIC X(100).

       PROCEDURE DIVISION.
           DISPLAY "Enter your favorite color: " WITH NO ADVANCING.
           ACCEPT COLOR1.
           DISPLAY "Enter your favorite animal: " WITH NO ADVANCING.
           ACCEPT ANIMAL.

           STRING
               "You like a " DELIMITED BY SIZE
               COLOR1        DELIMITED BY SPACE
               " "          DELIMITED BY SIZE
               ANIMAL       DELIMITED BY SPACE
               "."          DELIMITED BY SIZE
               INTO SENTENCE1
           END-STRING.

           DISPLAY SENTENCE1.

           STOP RUN.
