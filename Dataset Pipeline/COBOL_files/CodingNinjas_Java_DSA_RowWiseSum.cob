       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_RowWiseSum.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_ROWWISESUM_CLASS_ROWWISESUM_GLOBAL
       01  MAT_ROWWISESUM_-ARRAY.
           05  mat_rowWiseSum PIC S9(5) OCCURS 100 TIMES.
      * Variables for Scope:FOR_BLOCK_METHOD_ROWWISESUM_CLASS_ROWWISESUM_GLOBAL
       01  i_rowWiseSum    PIC S9(5).
      * Variables for Scope:BLOCK_FOR_BLOCK_METHOD_ROWWISESUM_CLASS_ROWWISESUM_GLOBAL
       01  sum_rowWiseSum  PIC S9(5).
      * Variables for Scope:FOR_BLOCK_FOR_BLOCK_METHOD_ROWWISESUM_CLASS_ROWWISESUM_GLOBAL
       01  j_rowWiseSum    PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       rowWiseSum-PARA.
      * Your code goes here
       PERFORM VARYING i_rowWiseSum FROM 0 BY 1 UNTIL NOT (i_rowWiseSum < mat_rowWiseSum.length)
       MOVE 0 TO sum_rowWiseSum
       PERFORM VARYING j_rowWiseSum FROM 0 BY 1 UNTIL NOT (j_rowWiseSum < mat_rowWiseSum[0].length)
       COMPUTE TEMP_0 = i_rowWiseSum + 1
       COMPUTE TEMP_1 = TEMP_0 + j_rowWiseSum
       COMPUTE sum_rowWiseSum = TEMP_1
       END-PERFORM
       DISPLAY sum_rowWiseSum WITH NO ADVANCING
       DISPLAY " " WITH NO ADVANCING
       END-PERFORM
       EXIT.


