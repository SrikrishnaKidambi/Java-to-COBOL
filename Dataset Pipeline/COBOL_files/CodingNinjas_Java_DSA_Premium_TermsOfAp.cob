       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_Premium_TermsOfAp.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TERMSOFAP_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TERMSOFAP_GLOBAL
       01  s_main          PIC X(100).
       01  n_main          PIC S9(5).
       01  current_main    PIC S9(5).
       01  count_main      PIC S9(5).
      * Variables for Scope:BLOCK_WHILE_BLOCK_METHOD_MAIN_CLASS_TERMSOFAP_GLOBAL
       01  output_main     PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * TODO Auto-generated method stub
      * Input from ODT is enabled
       ACCEPT n_main
       PERFORM UNTIL NOT (count_main <= n_main)
       COMPUTE TEMP_0 = 3 * current_main
       COMPUTE TEMP_1 = TEMP_0 + 2
       COMPUTE output_main = TEMP_1
       DIVIDE output_main BY 4 GIVING TEMP_2 REMAINDER TEMP_2
       IF TEMP_2 != 0
       DISPLAY output_main WITH NO ADVANCING
       DISPLAY " " WITH NO ADVANCING
       ADD 1 TO count_main
       END-IF
       ADD 1 TO current_main
       END-PERFORM
       EXIT.


