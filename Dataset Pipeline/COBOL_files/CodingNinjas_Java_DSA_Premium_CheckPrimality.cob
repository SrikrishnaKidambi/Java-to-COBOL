       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_Premium_CheckPrimality.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_CHECKPRIMALITY_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_CHECKPRIMALITY_GLOBAL
       01  s_main          PIC X(100).
       01  n_main          PIC S9(5).
       01  div_main        PIC S9(5).
       01  isPrime_main    PIC X(1).
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
       MOVE 'Y' TO isPrime_main
      * we start from 2 because 1 and 2 are anyway prime.
       MOVE 2 TO div_main
      * case 1
      * while(div<n) {
      * if(n%div==0) {
      * isPrime=false;
      * break;
      * }
      * div = div+1;
      * }
      * case 2, optimzed Version
      * while(div<=n/2) {  //because factors appear in pairs
      * if(n%div==0) {
      * isPrime=false;
      * break;
      * }
      * div = div+1;
      * }
      * case 3, more optimized version
       COMPUTE TEMP_0 = div_main * div_main
       PERFORM UNTIL NOT (TEMP_0 <= n_main)
      * here we check only till sqrt(n)
       DIVIDE n_main BY div_main GIVING TEMP_1 REMAINDER TEMP_1
       IF TEMP_1 = 0
       MOVE 'N' TO isPrime_main
      * if it divided even once dont check any further, break out of the loop.
       EXIT PERFORM
       END-IF
       ADD div_main TO 1 GIVING div_main
       COMPUTE TEMP_0 = div_main * div_main
       END-PERFORM
       IF isPrime_main
       DISPLAY "Number is Prime"
       ELSE
       DISPLAY "Number is not Prime"
       END-IF
       EXIT.


