       IDENTIFICATION DIVISION.
       PROGRAM-ID. SAMPLE.
       AUTHOR. "SRIKRISHNA KIDAMBI".

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  fullname      PIC X(100).
       01  firstname      PIC X(40).
       01  updatedFirstname      PIC X(40).
       01  lastname      PIC X(20).
       01  parts-array.
           05 parts PIC X(20) OCCURS 2 TIMES.
       01  result      PIC X.
       01  a     PIC S999.
       01  b     PIC S999.
       01  val   PIC S999.
       01  x  PIC X.
       01  y  PIC X.
       01  z  PIC X.

       PROCEDURE DIVISION.

      * ASCII 65
      * ASCII 66
      * 'A' + 2 = 'C'
       MOVE 10 TO a.
       MOVE 5 TO b.
      * Compound assignments with char and int
       MOVE FUNCTION CHAR(FUNCTION ORD(x) + 1) TO x.
      * 'A' + 1 = 'B'
       MOVE FUNCTION CHAR(FUNCTION ORD(y) + FUNCTION ORD(x) 
       + FUNCTION ORD(z)) TO y.
      * y = y + x + z
       ADD a TO b GIVING val.
      * sum integers
       COMPUTE val = val + FUNCTION ORD(x).
      * add char x's ASCII value to sum
       MOVE FUNCTION CHAR((FUNCTION ORD(x) + FUNCTION ORD(y))) 
       TO result.
      * add ASCII values of x and y
      * Print final values
       DISPLAY "x = "   x.
      * Should print: x = B
       DISPLAY "y = "   y.
      * y updated with x+z
       DISPLAY "z = "   z.
      * Should print: z = A
       DISPLAY "val = "   val.
       DISPLAY "a = " a.
      * sum with char x converted to int
       DISPLAY "b = " b.
       DISPLAY "result = "   result.
       STOP RUN.
       