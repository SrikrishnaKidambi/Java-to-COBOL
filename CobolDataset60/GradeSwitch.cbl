       IDENTIFICATION DIVISION.
       PROGRAM-ID. GradeSwitch.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_-ARRAY    .
           05  args         PIC X(10) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  sc              PIC X(10).
       01  grade           PIC X(1).


       PROCEDURE DIVISION.


       MAIN-PARA.
      * Input from ODT is enabled
       DISPLAY "Enter grade (A/B/C/D): " WITH NO ADVANCING
       ACCEPT grade
       EVALUATE grade
       WHEN 'A'
       DISPLAY "Excellent"
       WHEN 'B'
       DISPLAY "Good"
       WHEN 'C'
       DISPLAY "Average"
       WHEN 'D'
       DISPLAY "Poor"
       WHEN OTHER
       DISPLAY "Invalid grade"
       END-EVALUATE
       EXIT.
       STOP RUN.

