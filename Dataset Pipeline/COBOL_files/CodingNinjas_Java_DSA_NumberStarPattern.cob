       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_NumberStarPattern.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_NUMBERSTARPATTERN_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_NUMBERSTARPATTERN_GLOBAL
       01  scan_main       PIC X(100).
       01  N_main          PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_NUMBERSTARPATTERN_GLOBAL
       01  i_main          PIC S9(5).
      * Variables for Scope:FOR_BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_NUMBERSTARPATTERN_GLOBAL
       01  j_main          PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Write your code here
      * Input from ODT is enabled
       ACCEPT N_main
       PERFORM VARYING i_main FROM 1 BY 1 UNTIL NOT (i_main <= N_main)
       PERFORM VARYING j_main FROM N_main BY -1 UNTIL NOT (j_main >= 1)
       IF j_main = i_main
       DISPLAY "*" WITH NO ADVANCING
       ELSE
       DISPLAY j_main WITH NO ADVANCING
       END-IF
       END-PERFORM
       DISPLAY ""
       END-PERFORM
       EXIT.


