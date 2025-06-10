       IDENTIFICATION DIVISION.
       PROGRAM-ID. Factorial.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N              PIC 9(4) VALUE 0.
       01 I              PIC 9(4) VALUE 2.
       01 FACT           PIC 9(18) VALUE 1.

       PROCEDURE DIVISION.
           DISPLAY "Enter a number: " WITH NO ADVANCING.
           ACCEPT N.

           IF N = 0 OR N = 1 THEN
               MOVE 1 TO FACT
           ELSE
               PERFORM VARYING I FROM 2 BY 1 UNTIL I > N
                   COMPUTE FACT = FACT * I
               END-PERFORM
           END-IF.

           DISPLAY "Factorial of " N " is " FACT.

           STOP RUN.
