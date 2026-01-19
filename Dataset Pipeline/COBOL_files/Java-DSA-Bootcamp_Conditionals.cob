       IDENTIFICATION DIVISION.
       PROGRAM-ID. Java-DSA-Bootcamp_Conditionals.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_CONDITIONALS_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_CONDITIONALS_GLOBAL
       01  salary_main     PIC S9(5).
       01  a_main          PIC S9(5).
       01  b_main          PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Syntax of if statements:
            if (boolean expression T or F) {
                // body
            } else {
                // do this
            }
       MOVE 25400 TO salary_main
      * if (salary > 10000) {
      * salary = salary + 2000;
      * } else {
      * salary = salary + 1000;
      * }
      * multiple if-else
      * if (salary > 10000) {
      * salary += 2000; // salary = salary + 2000
      * } else if (salary > 20000) {
      * salary += 3000;
      * } else {
      * salary += 1000;
      * }
      * 
      * System.out.println(salary);
       MOVE 10 TO a_main
       MOVE 40 TO b_main
       IF a_main != 35
       DISPLAY "Hello World"
       END-IF
       EXIT.


