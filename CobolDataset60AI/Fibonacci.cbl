       IDENTIFICATION DIVISION.
       PROGRAM-ID. Fibonacci.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N         PIC 9(3) VALUE 0.
       01 A         PIC 9(6) VALUE 0.
       01 B         PIC 9(6) VALUE 1.
       01 NEXT1      PIC 9(6) VALUE 0.
       01 I         PIC 9(3) VALUE 1.

       PROCEDURE DIVISION.
           DISPLAY "Enter number of terms: " WITH NO ADVANCING.
           ACCEPT N.

           DISPLAY "Fibonacci Series: " WITH NO ADVANCING.

           PERFORM VARYING I FROM 1 BY 1 UNTIL I > N
               DISPLAY A WITH NO ADVANCING
               DISPLAY " " WITH NO ADVANCING
               COMPUTE NEXT1 = A + B
               MOVE B TO A
               MOVE NEXT1 TO B
           END-PERFORM.

           DISPLAY " ".
           STOP RUN.
