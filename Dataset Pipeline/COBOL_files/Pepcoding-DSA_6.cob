       IDENTIFICATION DIVISION.
       PROGRAM-ID. Pepcoding-DSA_6.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  scn_main        PIC X(100).
       01  n_main          PIC S9(5).
       01  spaces_main     PIC S9(5).
       01  stars_main      PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  i_main          PIC S9(5).
      * Variables for Scope:FOR_BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  j_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
       ACCEPT n_main
       COMPUTE TEMP_0 = n_main / 2
       COMPUTE TEMP_1 = TEMP_0 + 1
       COMPUTE spaces_main = TEMP_1
       PERFORM VARYING i_main FROM 1 BY 1 UNTIL NOT (i_main <= n_main)
       PERFORM VARYING j_main FROM 1 BY 1 UNTIL NOT (j_main <= stars_main)
       DISPLAY "*\t" WITH NO ADVANCING
       END-PERFORM
       PERFORM VARYING j_main FROM 1 BY 1 UNTIL NOT (j_main <= spaces_main)
       DISPLAY "\t" WITH NO ADVANCING
       END-PERFORM
       PERFORM VARYING j_main FROM 1 BY 1 UNTIL NOT (j_main <= stars_main)
       DISPLAY "*\t" WITH NO ADVANCING
       END-PERFORM
       IF i_main <= n_main / 2
       SUBTRACT 1 FROM stars_main
       ADD spaces_main TO 2 GIVING spaces_main
       ELSE
       ADD 1 TO stars_main
       SUBTRACT 2 FROM spaces_main GIVING spaces_main
       END-IF
       END-PERFORM
       EXIT.


