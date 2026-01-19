       IDENTIFICATION DIVISION.
       PROGRAM-ID. Pepcoding-DSA_Palindromic Substrings.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_ISPALINDROME_CLASS_MAIN_GLOBAL
       01  str_isPalindrome PIC X(100).
      * Variables for Scope:BLOCK_METHOD_ISPALINDROME_CLASS_MAIN_GLOBAL
       01  left_isPalindrome PIC S9(5).
       01  right_isPalindrome PIC S9(5).
      * Variables for Scope:METHOD_SOLUTION_CLASS_MAIN_GLOBAL
       01  str_solution    PIC X(100).
      * Variables for Scope:BLOCK_METHOD_SOLUTION_CLASS_MAIN_GLOBAL
       01  scn_solution    PIC X(100).
      * Variables for Scope:FOR_BLOCK_METHOD_SOLUTION_CLASS_MAIN_GLOBAL
       01  st_solution     PIC S9(5).
      * Variables for Scope:FOR_BLOCK_FOR_BLOCK_METHOD_SOLUTION_CLASS_MAIN_GLOBAL
       01  end_solution    PIC S9(5).
      * Variables for Scope:BLOCK_FOR_BLOCK_FOR_BLOCK_METHOD_SOLUTION_CLASS_MAIN_GLOBAL
       01  subString_solution PIC X(100).
      * Variables for Scope:METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  scn_main        PIC X(100).
       01  str_main        PIC X(100).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).
       01 TEMP_4 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       isPalindrome-PARA.
       COMPUTE TEMP_0 = length - 1
       COMPUTE left_isPalindrome = TEMP_0
       PERFORM UNTIL NOT (left_isPalindrome < right_isPalindrome)
       COMPUTE TEMP_1 = left_isPalindrome
       IF TEMP_1 != str_isPalindrome.charAt(right_isPalindrome)
       END-IF
       ADD 1 TO left_isPalindrome
       SUBTRACT 1 FROM right_isPalindrome
       END-PERFORM
       EXIT.


       solution-PARA.
      * Input from ODT is enabled
       COMPUTE TEMP_2 = str_solution.length()
       PERFORM VARYING st_solution FROM 0 BY 1 UNTIL NOT (st_solution < TEMP_2)
       COMPUTE TEMP_3 = str_solution.length()
       PERFORM VARYING end_solution FROM st_solution BY 1 UNTIL NOT (end_solution < TEMP_3)
       MOVE isPalindrome(subString_solution) TO TEMP_4
       IF TEMP_4 = true
       DISPLAY subString_solution
       END-IF
       COMPUTE TEMP_3 = str_solution.length()
       END-PERFORM
       COMPUTE TEMP_2 = str_solution.length()
       END-PERFORM
       EXIT.


       MAIN-PARA.
      * Input from ODT is enabled
       ACCEPT str_main
       MOVE str_main TO str_solution
       PERFORM solution-PARA
       EXIT.


