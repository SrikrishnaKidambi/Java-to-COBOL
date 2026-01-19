       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_PrintWaves.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_WAVEPRINT_CLASS_PRINTWAVES_GLOBAL
       01  MAT_WAVEPRINT_-ARRAY.
           05  mat_wavePrint PIC S9(5) OCCURS 100 TIMES.
      * Variables for Scope:FOR_BLOCK_IF_BLOCK_METHOD_WAVEPRINT_CLASS_PRINTWAVES_GLOBAL
       01  i_wavePrint     PIC S9(5).
      * Variables for Scope:FOR_BLOCK_IF_BLOCK_FOR_BLOCK_IF_BLOCK_METHOD_WAVEPRINT_CLASS_PRINTWAVES_GLOBAL
       01  j_wavePrint     PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).
       01 TEMP_4 PIC S9(9).
       01 TEMP_5 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       wavePrint-PARA.
      * Your code goes here
       IF mat_wavePrint.length = 0
       DISPLAY "" WITH NO ADVANCING
       ELSE
       PERFORM VARYING i_wavePrint FROM 0 BY 1 UNTIL NOT (i_wavePrint < mat_wavePrint[0].length)
       DIVIDE i_wavePrint BY 2 GIVING TEMP_0 REMAINDER TEMP_0
       IF TEMP_0 = 0
       PERFORM VARYING j_wavePrint FROM 0 BY 1 UNTIL NOT (j_wavePrint < mat_wavePrint.length)
       COMPUTE TEMP_2 = j_wavePrint + 1
       COMPUTE TEMP_1 = i_wavePrint
       DISPLAY TEMP_1 WITH NO ADVANCING
       DISPLAY " " WITH NO ADVANCING
       END-PERFORM
       ELSE
       PERFORM VARYING j_wavePrint FROM mat_wavePrint BY -1 UNTIL NOT (j_wavePrint >= 0)
       COMPUTE TEMP_3 = length - 1
       COMPUTE j_wavePrint = TEMP_3
       COMPUTE TEMP_5 = j_wavePrint + 1
       COMPUTE TEMP_4 = i_wavePrint
       DISPLAY TEMP_4 WITH NO ADVANCING
       DISPLAY " " WITH NO ADVANCING
       END-PERFORM
       END-IF
       END-PERFORM
       END-IF
       EXIT.


