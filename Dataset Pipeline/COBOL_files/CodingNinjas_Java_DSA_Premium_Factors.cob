       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_Premium_Factors.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_FACTORS_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_FACTORS_GLOBAL
       01  s_main          PIC X(100).
       01  number_main     PIC S9(5).
       01  divisor_main    PIC S9(5).
       01 TEMP_0 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * TODO Auto-generated method stub
      * Input from ODT is enabled
       ACCEPT number_main
       MOVE 2 TO divisor_main
       PERFORM UNTIL NOT (divisor_main < number_main)
       DIVIDE number_main BY divisor_main GIVING TEMP_0 REMAINDER TEMP_0
       IF TEMP_0 = 0
       DISPLAY divisor_main WITH NO ADVANCING
       DISPLAY "\t" WITH NO ADVANCING
       END-IF
       ADD 1 TO divisor_main
       END-PERFORM
       EXIT.


