       IDENTIFICATION DIVISION.
       PROGRAM-ID. TestCase17.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:BLOCK_METHOD_CHECKSIGN_CLASS_TEST_GLOBAL
       01  num_checkSign   PIC S9(5).
       01  sign_checkSign  PIC S9(5)V9(2).
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.


       PROCEDURE DIVISION.


       checkSign-PARA.
       COMPUTE num_checkSign = -25
       COMPUTE sign_checkSign = FUNCTION SIGN(num_checkSign)
       IF sign_checkSign > 0
       DISPLAY "Number is positive"
       ELSE
       IF sign_checkSign < 0
       DISPLAY "Number is negative"
       ELSE
       DISPLAY "Number is zero"
       END-IF
       END-IF.
       GOBACK
       EXIT.

       MAIN-PARA.
       PERFORM CHECKSIGN-PARA
       EXIT.
       STOP RUN.

