       IDENTIFICATION DIVISION.
       PROGRAM-ID. SAMPLE.
       AUTHOR. "SRIKRISHNA KIDAMBI".

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  c PIC S99.
       01  result PIC S99.
       01  a PIC S99 VALUE 5.
       01  b PIC S99 VALUE 10.

       PROCEDURE DIVISION.

       MOVE 5 TO a.
       MOVE 10 TO b.
      * Basic move statement
       MOVE b TO a.
       DIVIDE a BY b GIVING c REMAINDER c.
       DIVIDE a BY b GIVING a REMAINDER a.
       ADD 1 TO a.
       SUBTRACT 1 FROM c.
       COMPUTE a = a + a + b - c.
       SUBTRACT 1 FROM b.
      * result += ++c;
      * Print results to verify logic
       DISPLAY "a = "   a.
       DISPLAY "b = "   b.
      * hello world
       DISPLAY "c = "   c.