       IDENTIFICATION DIVISION.
       PROGRAM-ID. StringJoiner.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_-ARRAY    .
           05  args         PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  sc              PIC X(100).
       01  first1           PIC X(100).
       01  last1            PIC X(100).
       01  full1            PIC X(100).


       PROCEDURE DIVISION.


       MAIN-PARA.
      * Input from ODT is enabled
       DISPLAY "Enter first name: " WITH NO ADVANCING
       ACCEPT first1
       DISPLAY "Enter last name: " WITH NO ADVANCING
       ACCEPT last1
       STRING        first1 DELIMITED BY SPACE 
       " " DELIMITED BY SIZE 
       last1 DELIMITED BY SPACE INTO full1
       DISPLAY "Full name: "   full1
       EXIT.
       STOP RUN.

