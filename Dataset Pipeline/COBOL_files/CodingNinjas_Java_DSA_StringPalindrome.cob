       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_StringPalindrome.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_CHECKPALINDROME_CLASS_STRINGPALINDROME_GLOBAL
       01  str_checkPalindrome PIC X(100).
      * Variables for Scope:BLOCK_METHOD_CHECKPALINDROME_CLASS_STRINGPALINDROME_GLOBAL
       01  check_checkPalindrome PIC X(100).
      * Variables for Scope:FOR_BLOCK_METHOD_CHECKPALINDROME_CLASS_STRINGPALINDROME_GLOBAL
       01  i_checkPalindrome PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       checkPalindrome-PARA.
       MOVE "" TO check_checkPalindrome
       COMPUTE TEMP_0 = str_checkPalindrome.length()
       PERFORM VARYING i_checkPalindrome FROM 0 BY 1 UNTIL NOT (i_checkPalindrome < TEMP_0)
       COMPUTE TEMP_1 = i_checkPalindrome + check_checkPalindrome
       COMPUTE check_checkPalindrome = TEMP_1
       COMPUTE TEMP_0 = str_checkPalindrome.length()
       END-PERFORM
       PERFORM return-PARA
       EXIT.


