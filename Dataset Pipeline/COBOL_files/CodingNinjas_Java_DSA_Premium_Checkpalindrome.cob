       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_Premium_Checkpalindrome.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_CHECKPALINDROME_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_CHECKPALINDROME_GLOBAL
       01  s_main          PIC X(100).
       01  n_main          PIC S9(5).
       01  reversedNumber_main PIC S9(5).
       01  testNumber_main PIC S9(5).
      * Variables for Scope:BLOCK_WHILE_BLOCK_METHOD_MAIN_CLASS_CHECKPALINDROME_GLOBAL
       01  lastDigit_main  PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * TODO Auto-generated method stub
      * Input from ODT is enabled
       ACCEPT n_main
       MOVE 0 TO reversedNumber_main
       MOVE n_main TO testNumber_main
       PERFORM UNTIL NOT (n_main > 0)
       DIVIDE n_main BY 10 GIVING lastDigit_main REMAINDER lastDigit_main
       COMPUTE TEMP_0 = reversedNumber_main * 10
       COMPUTE TEMP_1 = TEMP_0 + lastDigit_main
       COMPUTE reversedNumber_main = TEMP_1
       DIVIDE n_main BY 10 GIVING n_main
       END-PERFORM
       IF reversedNumber_main = testNumber_main
       DISPLAY "true"
       ELSE
       DISPLAY "false"
       END-IF
       EXIT.


