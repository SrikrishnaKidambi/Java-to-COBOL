       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_ZerosStarsPattern.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_ZEROSSTARSPATTERN_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_ZEROSSTARSPATTERN_GLOBAL
       01  scan_main       PIC X(100).
       01  N_main          PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_ZEROSSTARSPATTERN_GLOBAL
       01  i_main          PIC S9(5).
      * Variables for Scope:FOR_BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_ZEROSSTARSPATTERN_GLOBAL
       01  j_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Read input as specified in the question.
    		 * Print output as specified in the question.
      * Input from ODT is enabled
       ACCEPT N_main
       PERFORM VARYING i_main FROM 1 BY 1 UNTIL NOT (i_main <= N_main)
       PERFORM VARYING j_main FROM 1 BY 1 UNTIL NOT (j_main < i_main)
       DISPLAY "0" WITH NO ADVANCING
       END-PERFORM
       DISPLAY "*" WITH NO ADVANCING
       COMPUTE TEMP_0 = (N_main - i_main)
       PERFORM VARYING j_main FROM 1 BY 1 UNTIL NOT (j_main <= TEMP_0)
       DISPLAY "0" WITH NO ADVANCING
       COMPUTE TEMP_0 = (N_main - i_main)
       END-PERFORM
       DISPLAY "*" WITH NO ADVANCING
       PERFORM VARYING j_main FROM N_main BY -1 UNTIL NOT (j_main >= 1)
       SUBTRACT i_main FROM N_main GIVING j_main
       DISPLAY "0" WITH NO ADVANCING
       END-PERFORM
       DISPLAY "*" WITH NO ADVANCING
       PERFORM VARYING j_main FROM 1 BY 1 UNTIL NOT (j_main < i_main)
       DISPLAY "0" WITH NO ADVANCING
       END-PERFORM
       DISPLAY ""
       END-PERFORM
       EXIT.


