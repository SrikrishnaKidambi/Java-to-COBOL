       IDENTIFICATION DIVISION.
       PROGRAM-ID. SAMPLE.
       AUTHOR. "SRIKRISHNA KIDAMBI".

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  c PIC S99.
       01  a PIC S99 VALUE 5.
       01  b PIC S99 VALUE 10.

       PROCEDURE DIVISION.

       MOVE 5 TO a.
       MOVE 10 TO b.
       MOVE b TO a.
       SUBTRACT b FROM a GIVING c.
       SUBTRACT b FROM a.
       SUBTRACT 1 FROM a.
       SUBTRACT 1 FROM a.
       MOVE a TO c.
       SUBTRACT 1 FROM a.
       SUBTRACT 1 FROM a.
       MOVE a TO c.
       DISPLAY "a = "   a.
       DISPLAY "b = "   b.
       DISPLAY "c = "   c.