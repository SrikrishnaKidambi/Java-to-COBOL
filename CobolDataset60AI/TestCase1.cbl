       IDENTIFICATION DIVISION.
       PROGRAM-ID. TESTCASE1.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 A             PIC S9(4) COMP-5 VALUE 15.
       01 B             PIC S9(4) COMP-5 VALUE 9.
       01 MIN-VAL       PIC S9(4) COMP-5.
       01 MOD-VAL       PIC S9(4) COMP-5.
       01 SIGN-VAL      PIC S9(4) COMP-5.
       01 TEMP          PIC S9(4) COMP-5.

       PROCEDURE DIVISION.
      * --- Math.min(a, b)
           IF A < B
               MOVE A TO MIN-VAL
           ELSE
               MOVE B TO MIN-VAL
           END-IF

      * --- Math.floorMod(-7, b)
           MOVE -7 TO TEMP
           COMPUTE MOD-VAL = FUNCTION MOD(TEMP, B)
           IF MOD-VAL < 0
               ADD B TO MOD-VAL
           END-IF

      * --- Integer.signum(-5)
           IF -5 < 0
               MOVE -1 TO SIGN-VAL
           ELSE IF -5 = 0
               MOVE 0 TO SIGN-VAL
           ELSE
               MOVE 1 TO SIGN-VAL
           END-IF

      * --- Display results
           DISPLAY "Min: " MIN-VAL
           DISPLAY "Mod: " MOD-VAL
           DISPLAY "Sign: " SIGN-VAL

           STOP RUN.
