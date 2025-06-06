       IDENTIFICATION DIVISION.
       PROGRAM-ID. SPLIT-CSV.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 INPUT-LINE       PIC X(100).
       01 ITEMS.
          05 ITEM-1        PIC X(20).
          05 ITEM-2        PIC X(20).
          05 ITEM-3        PIC X(20).
          05 ITEM-4        PIC X(20).
          05 ITEM-5        PIC X(20).
       01 TEMP-WORD        PIC X(20).
       01 IDX              PIC 9 VALUE 1.
       01 CHAR-INDEX       PIC 99 VALUE 1.
       01 CHAR-VALUE       PIC X.

       PROCEDURE DIVISION.
           DISPLAY "Enter comma-separated values 5 vals: "
            WITH NO ADVANCING.
           ACCEPT INPUT-LINE.

           PERFORM VARYING CHAR-INDEX FROM 1 BY 1 
           UNTIL CHAR-INDEX > LENGTH OF INPUT-LINE
               MOVE INPUT-LINE(CHAR-INDEX:1) TO CHAR-VALUE
               IF CHAR-VALUE NOT = "," AND CHAR-VALUE NOT = LOW-VALUE
                   STRING TEMP-WORD DELIMITED BY SIZE
                          CHAR-VALUE DELIMITED BY SIZE
                          INTO TEMP-WORD
                   END-STRING
               ELSE
                   EVALUATE IDX
                       WHEN 1 MOVE TEMP-WORD TO ITEM-1
                       WHEN 2 MOVE TEMP-WORD TO ITEM-2
                       WHEN 3 MOVE TEMP-WORD TO ITEM-3
                       WHEN 4 MOVE TEMP-WORD TO ITEM-4
                       WHEN 5 MOVE TEMP-WORD TO ITEM-5
                   END-EVALUATE
                   ADD 1 TO IDX
                   MOVE SPACES TO TEMP-WORD
               END-IF
           END-PERFORM

      * Handle last item (no comma after it)
           IF TEMP-WORD NOT = SPACES AND IDX <= 5
               EVALUATE IDX
                   WHEN 1 MOVE TEMP-WORD TO ITEM-1
                   WHEN 2 MOVE TEMP-WORD TO ITEM-2
                   WHEN 3 MOVE TEMP-WORD TO ITEM-3
                   WHEN 4 MOVE TEMP-WORD TO ITEM-4
                   WHEN 5 MOVE TEMP-WORD TO ITEM-5
               END-EVALUATE
           END-IF

           DISPLAY "Items in reverse order:"
           DISPLAY ITEM-5
           DISPLAY ITEM-4
           DISPLAY ITEM-3
           DISPLAY ITEM-2
           DISPLAY ITEM-1

           STOP RUN.
