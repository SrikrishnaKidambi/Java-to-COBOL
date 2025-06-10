       IDENTIFICATION DIVISION.
       PROGRAM-ID. SENTENCE-SPLITTER.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 LINE1              PIC X(100).
       01 WORDS1.
          05 WORD-1         PIC X(20).
          05 WORD-2         PIC X(20).
          05 WORD-3         PIC X(20).
          05 WORD-4         PIC X(20).
          05 WORD-5         PIC X(20).
       01 POS               PIC 99 VALUE 1.
       01 CURRENT-WORD      PIC X(20).
       01 CHAR              PIC X.
       01 INDEX1             PIC 99 VALUE 1.
       01 CHAR-IDX          PIC 99 VALUE 1.

       PROCEDURE DIVISION.
           DISPLAY "Enter a sentence of 5 words: " WITH NO ADVANCING.
           ACCEPT LINE1.

           PERFORM VARYING CHAR-IDX FROM 1 BY 1 UNTIL CHAR-IDX >
            LENGTH OF LINE1
               MOVE LINE1(CHAR-IDX:1) TO CHAR
               IF CHAR NOT = SPACE AND CHAR NOT = LOW-VALUE
                   STRING CURRENT-WORD DELIMITED BY SIZE
                          CHAR DELIMITED BY SIZE
                          INTO CURRENT-WORD
                   END-STRING
               ELSE
                   EVALUATE POS
                       WHEN 1 MOVE CURRENT-WORD TO WORD-1
                       WHEN 2 MOVE CURRENT-WORD TO WORD-2
                       WHEN 3 MOVE CURRENT-WORD TO WORD-3
                       WHEN 4 MOVE CURRENT-WORD TO WORD-4
                       WHEN 5 MOVE CURRENT-WORD TO WORD-5
                   END-EVALUATE
                   ADD 1 TO POS
                   MOVE SPACES TO CURRENT-WORD
               END-IF
           END-PERFORM

           * Handle the last word if sentence doesn't end with space
           IF CURRENT-WORD NOT = SPACES AND POS <= 5
               EVALUATE POS
                   WHEN 1 MOVE CURRENT-WORD TO WORD-1
                   WHEN 2 MOVE CURRENT-WORD TO WORD-2
                   WHEN 3 MOVE CURRENT-WORD TO WORD-3
                   WHEN 4 MOVE CURRENT-WORD TO WORD-4
                   WHEN 5 MOVE CURRENT-WORD TO WORD-5
               END-EVALUATE
           END-IF

           DISPLAY "Words in the sentence:"
           DISPLAY WORD-1
           DISPLAY WORD-2
           DISPLAY WORD-3
           DISPLAY WORD-4
           DISPLAY WORD-5

           STOP RUN.
