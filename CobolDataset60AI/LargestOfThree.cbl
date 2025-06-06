       IDENTIFICATION DIVISION.
       PROGRAM-ID. LargestOfThree.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 A        PIC S9(5) VALUE 0.
       01 B        PIC S9(5) VALUE 0.
       01 C        PIC S9(5) VALUE 0.

       PROCEDURE DIVISION.
           DISPLAY "Enter three numbers (A B C): " WITH NO ADVANCING.
           ACCEPT A.
           ACCEPT B.
           ACCEPT C.

           IF A >= B AND A >= C THEN
               DISPLAY A " is largest"
           ELSE IF B >= A AND B >= C THEN
               DISPLAY B " is largest"
           ELSE
               DISPLAY C " is largest"
           END-IF.

           STOP RUN.
