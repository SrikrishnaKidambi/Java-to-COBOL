       IDENTIFICATION DIVISION.
       PROGRAM-ID. DepartmentYear.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 DEPT-CODE     PIC 9.
       01 YEAR-NUM      PIC 9.
       01 RESULT-MSG    PIC X(30).

       PROCEDURE DIVISION.
           DISPLAY "Enter department code (1: CSE, 2: ECE): " 
           WITH NO ADVANCING.
           ACCEPT DEPT-CODE.

           DISPLAY "Enter year (1/2/3/4): " WITH NO ADVANCING.
           ACCEPT YEAR-NUM.

           EVALUATE DEPT-CODE
               WHEN 1
                   EVALUATE YEAR-NUM
                       WHEN 1 MOVE "CSE First Year"     TO RESULT-MSG
                       WHEN 2 MOVE "CSE Second Year"    TO RESULT-MSG
                       WHEN 3 MOVE "CSE Third Year"     TO RESULT-MSG
                       WHEN 4 MOVE "CSE Final Year"     TO RESULT-MSG
                       WHEN OTHER MOVE "Invalid year"   TO RESULT-MSG
                   END-EVALUATE
               WHEN 2
                   EVALUATE YEAR-NUM
                       WHEN 1 MOVE "ECE First Year"     TO RESULT-MSG
                       WHEN 2 MOVE "ECE Second Year"    TO RESULT-MSG
                       WHEN 3 MOVE "ECE Third Year"     TO RESULT-MSG
                       WHEN 4 MOVE "ECE Final Year"     TO RESULT-MSG
                       WHEN OTHER MOVE "Invalid year"   TO RESULT-MSG
                   END-EVALUATE
               WHEN OTHER
                   MOVE "Invalid department" TO RESULT-MSG
           END-EVALUATE

           DISPLAY RESULT-MSG.

           STOP RUN.
