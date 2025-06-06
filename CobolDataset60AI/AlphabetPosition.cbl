       IDENTIFICATION DIVISION.
       PROGRAM-ID. AlphabetPosition.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 CHAR-INPUT           PIC X.
       01 CHAR-CODE            PIC 9(3) COMP.
       01 A-CODE               PIC 9(3) COMP VALUE 97.
       01 POSITION1             PIC 9(3).

       PROCEDURE DIVISION.
       DISPLAY "Enter a lowercase letter: " WITH NO ADVANCING.
       ACCEPT CHAR-INPUT.

       COMPUTE CHAR-CODE = FUNCTION ORD(CHAR-INPUT).
       COMPUTE POSITION1 = CHAR-CODE - A-CODE + 1.

       DISPLAY "Position in alphabet: " POSITION1.

       STOP RUN.
