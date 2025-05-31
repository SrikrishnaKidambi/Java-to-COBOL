       IDENTIFICATION DIVISION.
       PROGRAM-ID. ContinueTest.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  I         PIC 9(2) VALUE 0.

       PROCEDURE DIVISION.
       
           PERFORM VARYING I FROM 0 BY 1 UNTIL I > 4
           MAIN-LOOP.
               IF I = 2 THEN
                   COMPUTE I = I + 1
                   GO TO MAIN-LOOP
               END-IF

               DISPLAY "Value of I: " I
           END-PERFORM.

           STOP RUN.