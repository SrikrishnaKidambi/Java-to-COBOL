       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_TermsOfAP.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TERMSOFAP_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TERMSOFAP_GLOBAL
       01  scan_main       PIC X(100).
       01  x_main          PIC S9(5).
       01  count_main      PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_TERMSOFAP_GLOBAL
       01  i_main          PIC S9(5).
      * Variables for Scope:BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_TERMSOFAP_GLOBAL
       01  val_main        PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Write your code here
      * Input from ODT is enabled
       ACCEPT x_main
       MOVE 0 TO count_main
       PERFORM VARYING i_main FROM 1 BY 1 UNTIL NOT (count_main < x_main)
       COMPUTE TEMP_0 = 3 * i_main
       COMPUTE TEMP_1 = TEMP_0 + 2
       COMPUTE val_main = TEMP_1
       DIVIDE val_main BY 4 GIVING TEMP_2 REMAINDER TEMP_2
       IF TEMP_2 != 0
       DISPLAY val_main WITH NO ADVANCING
       DISPLAY " " WITH NO ADVANCING
       ADD 1 TO count_main
       END-IF
       END-PERFORM
       EXIT.


