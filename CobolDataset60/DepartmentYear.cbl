       IDENTIFICATION DIVISION.
       PROGRAM-ID. DepartmentYear.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_-ARRAY    .
           05  args         PIC X(10) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  sc              PIC X(10).
       01  dept            PIC S9(5).
       01  year            PIC S9(5).


       PROCEDURE DIVISION.


       MAIN-PARA.
      * Input from ODT is enabled
       DISPLAY "Enter department code (1: CSE, 2: ECE): " 
       WITH NO ADVANCING
       ACCEPT dept
       DISPLAY "Enter year (1/2/3/4): " WITH NO ADVANCING
       ACCEPT year
       EVALUATE dept
       WHEN 1
       EVALUATE year
       WHEN 1
       DISPLAY "CSE First Year"
       WHEN 2
       DISPLAY "CSE Second Year"
       WHEN 3
       DISPLAY "CSE Third Year"
       WHEN 4
       DISPLAY "CSE Final Year"
       WHEN OTHER
       DISPLAY "Invalid year"
       END-EVALUATE
       WHEN 2
       EVALUATE year
       WHEN 1
       DISPLAY "ECE First Year"
       WHEN 2
       DISPLAY "ECE Second Year"
       WHEN 3
       DISPLAY "ECE Third Year"
       WHEN 4
       DISPLAY "ECE Final Year"
       WHEN OTHER
       DISPLAY "Invalid year"
       END-EVALUATE
       WHEN OTHER
       DISPLAY "Invalid department"
       END-EVALUATE
       EXIT.
       STOP RUN.

