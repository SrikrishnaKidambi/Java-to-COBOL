       IDENTIFICATION DIVISION.
       PROGRAM-ID. Pepcoding-DSA_3.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  scn_main        PIC X(100).
       01  n_main          PIC S9(5).
       01  stars_main      PIC S9(5).
       01  spaces_main     PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  i_main          PIC S9(5).
      * Variables for Scope:FOR_BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  j_main          PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
      * write ur code here
       ACCEPT n_main
       MOVE 1 TO stars_main
       SUBTRACT 1 FROM n_main GIVING spaces_main
       PERFORM VARYING i_main FROM 1 BY 1 UNTIL NOT (i_main <= n_main)
       PERFORM VARYING j_main FROM 1 BY 1 UNTIL NOT (j_main <= spaces_main)
       DISPLAY "	" WITH NO ADVANCING
       END-PERFORM
       PERFORM VARYING j_main FROM 1 BY 1 UNTIL NOT (j_main <= stars_main)
       DISPLAY "*	" WITH NO ADVANCING
       END-PERFORM
       ADD 1 TO stars_main
       SUBTRACT 1 FROM spaces_main
       END-PERFORM
       EXIT.


