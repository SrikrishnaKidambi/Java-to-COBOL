       IDENTIFICATION DIVISION.
       PROGRAM-ID. PALINDROME-NUMBER.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 NUM             PIC 9(5).
       01 ORIGINAL        PIC 9(5).
       01 REV             PIC 9(5) VALUE 0.
       01 DIGIT           PIC 9.
       01 TEMP            PIC 9(5).

       PROCEDURE DIVISION.
           DISPLAY "Enter a number: " WITH NO ADVANCING.
           ACCEPT NUM.
           MOVE NUM TO ORIGINAL.

           PERFORM UNTIL NUM = 0
               COMPUTE DIGIT = FUNCTION MOD(NUM, 10)
               COMPUTE REV = REV * 10 + DIGIT
               COMPUTE NUM = NUM / 10
           END-PERFORM.

           IF ORIGINAL = REV
               DISPLAY "Palindrome"
           ELSE
               DISPLAY "Not a palindrome"
           END-IF.

           STOP RUN.
