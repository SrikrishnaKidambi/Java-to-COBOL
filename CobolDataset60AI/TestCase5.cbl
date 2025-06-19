       IDENTIFICATION DIVISION.
       PROGRAM-ID. TESTCASE5.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 CHAR-ARRAY.
           05 CHARS     PIC X OCCURS 4 TIMES.
       01 I             PIC 9 VALUE 1.
       01 MAX-CHAR      PIC X VALUE LOW-VALUES.
       01 MIN-CHAR      PIC X VALUE HIGH-VALUES.

       PROCEDURE DIVISION.
           MOVE 'A' TO CHARS(1)
           MOVE 'b' TO CHARS(2)
           MOVE 'Z' TO CHARS(3)
           MOVE 'x' TO CHARS(4)

           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 4
               IF CHARS(I) > MAX-CHAR
                   MOVE CHARS(I) TO MAX-CHAR
               END-IF
               IF CHARS(I) < MIN-CHAR
                   MOVE CHARS(I) TO MIN-CHAR
               END-IF
           END-PERFORM

           DISPLAY "Max char: " MAX-CHAR
           DISPLAY "Min char: " MIN-CHAR

           STOP RUN.
