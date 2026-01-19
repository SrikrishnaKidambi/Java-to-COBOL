       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_PrintSpiral.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_SPIRALPRINT_CLASS_PRINTSPRIAL_GLOBAL
       01  MATRIX_SPIRALPRINT_-ARRAY.
           05  matrix_spiralPrint PIC S9(5) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_IF_BLOCK_METHOD_SPIRALPRINT_CLASS_PRINTSPRIAL_GLOBAL
       01  rstart_spiralPrint PIC S9(5).
       01  rend_spiralPrint PIC S9(5).
       01  cstart_spiralPrint PIC S9(5).
       01  cend_spiralPrint PIC S9(5).
       01  count_spiralPrint PIC S9(5).
      * Variables for Scope:FOR_BLOCK_WHILE_BLOCK_IF_BLOCK_METHOD_SPIRALPRINT_CLASS_PRINTSPRIAL_GLOBAL
       01  i_spiralPrint   PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).
       01 TEMP_4 PIC S9(9).
       01 TEMP_5 PIC S9(9).
       01 TEMP_6 PIC S9(9).
       01 TEMP_7 PIC S9(9).
       01 TEMP_8 PIC S9(9).
       01 TEMP_9 PIC S9(9).
       01 TEMP_10 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       spiralPrint-PARA.
      * Your code goes here
       IF matrix_spiralPrint.length = 0
       DISPLAY "" WITH NO ADVANCING
       ELSE
       COMPUTE TEMP_0 = 1 - length
       COMPUTE TEMP_1 = TEMP_0 - 1
       COMPUTE rstart_spiralPrint = TEMP_1
       COMPUTE TEMP_2 = 1 * length
       COMPUTE count_spiralPrint = TEMP_2
       PERFORM UNTIL NOT (count_spiralPrint > 0)
      * System.out.println("Left to right");
       PERFORM VARYING i_spiralPrint FROM cstart_spiralPrint BY 1 UNTIL NOT (i_spiralPrint <= cend_spiralPrint)
       COMPUTE TEMP_4 = rstart_spiralPrint + 1
       COMPUTE TEMP_3 = i_spiralPrint
       DISPLAY TEMP_3 WITH NO ADVANCING
       DISPLAY " " WITH NO ADVANCING
       SUBTRACT 1 FROM count_spiralPrint
       END-PERFORM
       ADD 1 TO rstart_spiralPrint
      * System.out.println("");
      * System.out.println("Top to bottom");
       PERFORM VARYING i_spiralPrint FROM rstart_spiralPrint BY 1 UNTIL NOT (i_spiralPrint <= rend_spiralPrint)
       COMPUTE TEMP_6 = i_spiralPrint + 1
       COMPUTE TEMP_5 = cend_spiralPrint
       DISPLAY TEMP_5 WITH NO ADVANCING
       DISPLAY " " WITH NO ADVANCING
       SUBTRACT 1 FROM count_spiralPrint
       END-PERFORM
       SUBTRACT 1 FROM cend_spiralPrint
      * System.out.println("");
      * System.out.println("Right to left");
       PERFORM VARYING i_spiralPrint FROM cend_spiralPrint BY -1 UNTIL NOT (i_spiralPrint >= cstart_spiralPrint)
       COMPUTE TEMP_8 = rend_spiralPrint + 1
       COMPUTE TEMP_7 = i_spiralPrint
       DISPLAY TEMP_7 WITH NO ADVANCING
       DISPLAY " " WITH NO ADVANCING
       SUBTRACT 1 FROM count_spiralPrint
       END-PERFORM
       SUBTRACT 1 FROM rend_spiralPrint
      * System.out.println("");
      * System.out.println("Bottom to top");
       PERFORM VARYING i_spiralPrint FROM rend_spiralPrint BY -1 UNTIL NOT (i_spiralPrint >= rstart_spiralPrint)
       COMPUTE TEMP_10 = i_spiralPrint + 1
       COMPUTE TEMP_9 = cstart_spiralPrint
       DISPLAY TEMP_9 WITH NO ADVANCING
       DISPLAY " " WITH NO ADVANCING
       SUBTRACT 1 FROM count_spiralPrint
       END-PERFORM
      * System.out.println("");
       ADD 1 TO cstart_spiralPrint
       END-PERFORM
       END-IF
       EXIT.


