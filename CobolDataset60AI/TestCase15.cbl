       IDENTIFICATION DIVISION.
       PROGRAM-ID. TESTCASE15.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ORIGINAL         PIC X(20) VALUE "CobolMapping".
       01 REVERSED         PIC X(20) VALUE SPACES.
       01 LEN              PIC 9(2) VALUE 0.
       01 I                PIC 9(2) VALUE 0.
       01 J                PIC 9(2) VALUE 0.
       01 CHAR-TEMP        PIC X.

       PROCEDURE DIVISION.
      * --- Calculate length of ORIGINAL (ignoring trailing spaces)
           INSPECT ORIGINAL TALLYING LEN FOR CHARACTERS BEFORE
            INITIAL SPACE

      * --- Reverse the string
           MOVE 1 TO I
           MOVE LEN TO J
           PERFORM UNTIL I > LEN
               MOVE ORIGINAL(I:1) TO CHAR-TEMP
               MOVE CHAR-TEMP TO REVERSED(J:1)
               ADD 1 TO I
               SUBTRACT 1 FROM J
           END-PERFORM

      * --- Display results
           DISPLAY "Original: " ORIGINAL
           DISPLAY "Reversed: " REVERSED

           STOP RUN.
