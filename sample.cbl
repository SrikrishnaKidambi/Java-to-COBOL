       IDENTIFICATION DIVISION.
       PROGRAM-ID. SAMPLE.
       AUTHOR. "SRIKRISHNA KIDAMBI".

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  c PIC S99.
       01  result PIC S99.
       01  a PIC S99 VALUE 5.
       01  b PIC S99 VALUE 10.
       01  grade PIC A(1).

       PROCEDURE DIVISION.

       MOVE "A" TO grade.
      * assigning the comments to the students according to the grades
       EVALUATE grade
       WHEN "A"
       DISPLAY "Excellent"
       WHEN "B"
       DISPLAY "Good"
       WHEN OTHER
       DISPLAY "Invalid"
       END-EVALUATE.
       MOVE 10 TO b.