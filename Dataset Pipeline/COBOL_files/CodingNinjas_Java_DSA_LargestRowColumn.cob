       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_LargestRowColumn.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_FINDLARGEST_CLASS_LARGESTROWCOLUMN_GLOBAL
       01  MAT_FINDLARGEST_-ARRAY.
           05  mat_findLargest PIC S9(5) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_IF_BLOCK_METHOD_FINDLARGEST_CLASS_LARGESTROWCOLUMN_GLOBAL
       01  rowidx_findLargest PIC S9(5).
       01  colidx_findLargest PIC S9(5).
       01  rowsum_findLargest PIC S9(5).
       01  colsum_findLargest PIC S9(5).
      * Variables for Scope:FOR_BLOCK_IF_BLOCK_METHOD_FINDLARGEST_CLASS_LARGESTROWCOLUMN_GLOBAL
       01  i_findLargest   PIC S9(5).
      * Variables for Scope:BLOCK_FOR_BLOCK_IF_BLOCK_METHOD_FINDLARGEST_CLASS_LARGESTROWCOLUMN_GLOBAL
       01  rsum_findLargest PIC S9(5).
       01  j_findLargest   PIC S9(5).
       01  csum_findLargest PIC S9(5).
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


       findLargest-PARA.
      * Your code goes here
       IF mat_findLargest.length = 0
       DISPLAY "row 0 " WITH NO ADVANCING
       DISPLAY Integer.MIN_VALUE WITH NO ADVANCING
       ELSE
       COMPUTE TEMP_0 = 1 - colidx_findLargest
       COMPUTE TEMP_1 = Integer - MIN_VALUE
       COMPUTE rowidx_findLargest = TEMP_1
       PERFORM VARYING i_findLargest FROM 0 BY 1 UNTIL NOT (i_findLargest < mat_findLargest.length)
       MOVE 0 TO rsum_findLargest
       PERFORM VARYING j_findLargest FROM 0 BY 1 UNTIL NOT (j_findLargest < mat_findLargest[0].length)
       COMPUTE TEMP_2 = i_findLargest + 1
       COMPUTE TEMP_3 = TEMP_2 + j_findLargest
       COMPUTE rsum_findLargest = TEMP_3
       END-PERFORM
      * System.out.println("Row " + i + " sum = " + rsum);
       IF rowsum_findLargest < rsum_findLargest
       MOVE rsum_findLargest TO rowsum_findLargest
       MOVE i_findLargest TO rowidx_findLargest
       END-IF
       END-PERFORM
       PERFORM VARYING i_findLargest FROM 0 BY 1 UNTIL NOT (i_findLargest < mat_findLargest[0].length)
       MOVE 0 TO csum_findLargest
       PERFORM VARYING j_findLargest FROM 0 BY 1 UNTIL NOT (j_findLargest < mat_findLargest.length)
       COMPUTE TEMP_4 = j_findLargest + 1
       COMPUTE TEMP_5 = TEMP_4 + i_findLargest
       COMPUTE csum_findLargest = TEMP_5
       END-PERFORM
      * System.out.println("Col " + i + " sum = " + csum);
       IF colsum_findLargest < csum_findLargest
       MOVE csum_findLargest TO colsum_findLargest
       MOVE i_findLargest TO colidx_findLargest
       END-IF
       END-PERFORM
       IF rowsum_findLargest >= colsum_findLargest
       DISPLAY "row " WITH NO ADVANCING
       DISPLAY rowidx_findLargest WITH NO ADVANCING
       DISPLAY " " WITH NO ADVANCING
       DISPLAY rowsum_findLargest WITH NO ADVANCING
       ELSE
       DISPLAY "column " WITH NO ADVANCING
       DISPLAY colidx_findLargest WITH NO ADVANCING
       DISPLAY " " WITH NO ADVANCING
       DISPLAY colsum_findLargest WITH NO ADVANCING
       END-IF
       END-IF
       EXIT.


