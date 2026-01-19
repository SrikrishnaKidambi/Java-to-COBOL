       IDENTIFICATION DIVISION.
       PROGRAM-ID. java-dsa-bootcamp_PalindromeOrNot.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_PALINDROMEORNOT_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_PALINDROMEORNOT_GLOBAL
       01  in_main         PIC X(100).
       01  str1_main       PIC X(100).
      * Variables for Scope:METHOD_REVERSE_CLASS_PALINDROMEORNOT_GLOBAL
       01  str_reverse     PIC X(100).
      * Variables for Scope:BLOCK_METHOD_REVERSE_CLASS_PALINDROMEORNOT_GLOBAL
       01  rev_reverse     PIC X(100).
      * Variables for Scope:FOR_BLOCK_METHOD_REVERSE_CLASS_PALINDROMEORNOT_GLOBAL
       01  i_reverse       PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       reverse-PARA.
       COMPUTE TEMP_0 = CASE - str_reverse
       COMPUTE str_reverse = TEMP_0
       MOVE "" TO rev_reverse
       PERFORM VARYING i_reverse FROM str_reverse BY -1 UNTIL NOT (i_reverse >= 0)
       COMPUTE TEMP_1 = length - 1
       COMPUTE i_reverse = TEMP_1
       COMPUTE TEMP_2 = charAt + i_reverse
       COMPUTE rev_reverse = TEMP_2
       END-PERFORM
       IF str_reverse.equals(rev_reverse)
       DISPLAY "Given String is Palindrome."
       ELSE
       DISPLAY "Given String is not a Palindrome." WITH NO ADVANCING
       END-IF
       EXIT.


       MAIN-PARA.
      * Input from ODT is enabled
       ACCEPT str1_main
       PERFORM reverse-PARA
       EXIT.


