       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_StarDiamond.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_STARDIAMOND_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_STARDIAMOND_GLOBAL
       01  scan_main       PIC X(100).
       01  N_main          PIC S9(5).
       01  spaces_main     PIC S9(5).
       01  val_main        PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_STARDIAMOND_GLOBAL
       01  i_main          PIC S9(5).
      * Variables for Scope:FOR_BLOCK_IF_BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_STARDIAMOND_GLOBAL
       01  j_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Write your code here
      * Input from ODT is enabled
       ACCEPT N_main
       DIVIDE N_main BY 2 GIVING spaces_main
       SUBTRACT 2 FROM N_main GIVING val_main
       PERFORM VARYING i_main FROM 0 BY 1 UNTIL NOT (i_main < N_main)
       IF i_main <= (N_main / 2)
       PERFORM VARYING j_main FROM 0 BY 1 UNTIL NOT (j_main < spaces_main)
       DISPLAY " " WITH NO ADVANCING
       END-PERFORM
       SUBTRACT 1 FROM spaces_main
       COMPUTE TEMP_0 = (2 * i_main) + 1
       PERFORM VARYING j_main FROM 0 BY 1 UNTIL NOT (j_main < TEMP_0)
       DISPLAY "*" WITH NO ADVANCING
       COMPUTE TEMP_0 = (2 * i_main) + 1
       END-PERFORM
       ELSE
       ADD 1 TO spaces_main
       PERFORM VARYING j_main FROM 0 BY 1 UNTIL NOT (j_main <= spaces_main)
       DISPLAY " " WITH NO ADVANCING
       END-PERFORM
       PERFORM VARYING j_main FROM 0 BY 1 UNTIL NOT (j_main < val_main)
       DISPLAY "*" WITH NO ADVANCING
       END-PERFORM
       SUBTRACT 2 FROM val_main GIVING val_main
       END-IF
       DISPLAY " "
       END-PERFORM
       EXIT.


