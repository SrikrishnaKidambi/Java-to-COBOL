       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_AlphaPattern.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_ALPHAPATTERN_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_ALPHAPATTERN_GLOBAL
       01  scan_main       PIC X(100).
       01  N_main          PIC S9(5).
       01  ch_main         PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_ALPHAPATTERN_GLOBAL
       01  i_main          PIC S9(5).
      * Variables for Scope:FOR_BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_ALPHAPATTERN_GLOBAL
       01  j_main          PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
       ACCEPT N_main
       MOVE 65 TO ch_main
       PERFORM VARYING i_main FROM 0 BY 1 UNTIL NOT (i_main < N_main)
       PERFORM VARYING j_main FROM 0 BY 1 UNTIL NOT (j_main <= i_main)
       DISPLAY (char) ch_main WITH NO ADVANCING
       END-PERFORM
       ADD 1 TO ch_main
       DISPLAY " "
       END-PERFORM
       EXIT.


