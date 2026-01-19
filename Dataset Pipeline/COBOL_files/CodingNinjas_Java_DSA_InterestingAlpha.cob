       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_InterestingAlpha.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_INTERESTINGALPHA_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_INTERESTINGALPHA_GLOBAL
       01  scan_main       PIC X(100).
       01  N_main          PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_INTERESTINGALPHA_GLOBAL
       01  i_main          PIC S9(5).
      * Variables for Scope:BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_INTERESTINGALPHA_GLOBAL
       01  ch_main         PIC S9(5).
      * Variables for Scope:FOR_BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_INTERESTINGALPHA_GLOBAL
       01  j_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Your code goes here
      * Input from ODT is enabled
       ACCEPT N_main
       PERFORM VARYING i_main FROM 0 BY 1 UNTIL NOT (i_main < N_main)
       COMPUTE TEMP_0 = N_main - 1
       COMPUTE TEMP_1 = 65 + TEMP_0
       COMPUTE TEMP_2 = TEMP_1 - i_main
       COMPUTE ch_main = TEMP_2
       PERFORM VARYING j_main FROM 0 BY 1 UNTIL NOT (j_main <= i_main)
       DISPLAY (char) ch_main WITH NO ADVANCING
       ADD 1 TO ch_main
       END-PERFORM
       DISPLAY " "
       END-PERFORM
       EXIT.


