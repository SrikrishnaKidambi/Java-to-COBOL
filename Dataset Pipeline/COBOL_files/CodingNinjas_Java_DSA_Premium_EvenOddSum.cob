       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_Premium_EvenOddSum.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EVENODDSUM_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EVENODDSUM_GLOBAL
       01  s_main          PIC X(100).
       01  number_main     PIC S9(5).
       01  evenSum_main    PIC S9(5).
       01  oddSum_main     PIC S9(5).
      * Variables for Scope:BLOCK_WHILE_BLOCK_METHOD_MAIN_CLASS_EVENODDSUM_GLOBAL
       01  lastNumber_main PIC S9(5).
       01 TEMP_0 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * TODO Auto-generated method stub
      * Input from ODT is enabled
       ACCEPT number_main
       MOVE 0 TO evenSum_main
       MOVE 0 TO oddSum_main
       PERFORM UNTIL NOT (number_main > 0)
       DIVIDE number_main BY 10 GIVING lastNumber_main REMAINDER lastNumber_main
       DIVIDE lastNumber_main BY 2 GIVING TEMP_0 REMAINDER TEMP_0
       IF TEMP_0 = 0
       ADD evenSum_main TO lastNumber_main GIVING evenSum_main
       ELSE
       ADD oddSum_main TO lastNumber_main GIVING oddSum_main
       END-IF
       DIVIDE number_main BY 10 GIVING number_main
       END-PERFORM
       DISPLAY evenSum_main
       DISPLAY "\t"
       DISPLAY oddSum_main
       EXIT.


