       IDENTIFICATION DIVISION.
       PROGRAM-ID. PalindromeNumber.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_-ARRAY    .
           05  args         PIC X(10) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  sc              PIC X(10).
       01  num             PIC S9(5).
       01  original        PIC S9(5).
       01  rev             PIC S9(5).
      * Variables for Scope:BLOCK_WHILE_BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  digit           PIC S9(5).


       PROCEDURE DIVISION.


       MAIN-PARA.
      * Input from ODT is enabled
       DISPLAY "Enter a number: " WITH NO ADVANCING
       ACCEPT num
       MOVE num TO original
       MOVE 0 TO rev
       PERFORM UNTIL NOT (num NOT= 0)
       DIVIDE num BY 10 GIVING digit REMAINDER digit
       COMPUTE rev = rev * 10 + digit
       DIVIDE num BY 10 GIVING num
       END-PERFORM
       IF original = rev
       DISPLAY "Palindrome"
       ELSE
       DISPLAY "Not a palindrome"
       END-IF
       EXIT.
       STOP RUN.

