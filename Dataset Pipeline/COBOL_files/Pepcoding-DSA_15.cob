       IDENTIFICATION DIVISION.
       PROGRAM-ID. Pepcoding-DSA_15.


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
       01  val_main        PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  i_main          PIC S9(5).
      * Variables for Scope:BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  temp_main       PIC S9(5).
      * Variables for Scope:FOR_BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  j_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
       ACCEPT n_main
       COMPUTE TEMP_0 = val_main / 1
       COMPUTE stars_main = TEMP_0
       PERFORM VARYING i_main FROM 1 BY 1 UNTIL NOT (i_main <= n_main)
       MOVE val_main TO temp_main
       PERFORM VARYING j_main FROM 1 BY 1 UNTIL NOT (j_main <= spaces_main)
       DISPLAY "	" WITH NO ADVANCING
       END-PERFORM
       PERFORM VARYING j_main FROM 1 BY 1 UNTIL NOT (j_main <= stars_main)
       DISPLAY temp_main WITH NO ADVANCING
       DISPLAY "	" WITH NO ADVANCING
       IF j_main <= stars_main / 2
       ADD 1 TO temp_main
       ELSE
       SUBTRACT 1 FROM temp_main
       END-IF
       END-PERFORM
       IF i_main <= n_main / 2
       ADD stars_main TO 2 GIVING stars_main
       SUBTRACT 1 FROM spaces_main
       ADD 1 TO val_main
       ELSE
       SUBTRACT 2 FROM stars_main GIVING stars_main
       ADD 1 TO spaces_main
       SUBTRACT 1 FROM val_main
       END-IF
       END-PERFORM
       EXIT.


