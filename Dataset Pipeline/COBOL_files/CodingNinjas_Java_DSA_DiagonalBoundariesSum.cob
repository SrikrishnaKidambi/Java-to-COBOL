       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_DiagonalBoundariesSum.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_TOTALSUM_CLASS_DIAGONALBOUNDARIESSUM_GLOBAL
       01  MAT_TOTALSUM_-ARRAY.
           05  mat_totalSum PIC S9(5) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_IF_BLOCK_METHOD_TOTALSUM_CLASS_DIAGONALBOUNDARIESSUM_GLOBAL
       01  sum_totalSum    PIC S9(5).
      * Variables for Scope:FOR_BLOCK_IF_BLOCK_METHOD_TOTALSUM_CLASS_DIAGONALBOUNDARIESSUM_GLOBAL
       01  i_totalSum      PIC S9(5).
      * Variables for Scope:FOR_BLOCK_FOR_BLOCK_IF_BLOCK_METHOD_TOTALSUM_CLASS_DIAGONALBOUNDARIESSUM_GLOBAL
       01  j_totalSum      PIC S9(5).
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
       01 TEMP_11 PIC S9(9).
       01 TEMP_12 PIC S9(9).
       01 TEMP_13 PIC S9(9).
       01 TEMP_14 PIC S9(9).
       01 TEMP_15 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       totalSum-PARA.
      * Your code goes here
       IF mat_totalSum.length = 0
       DISPLAY "0" WITH NO ADVANCING
       ELSE
      * System.out.println("Elements added: row 0 col 0");
      * System.out.println(sum);
       PERFORM VARYING i_totalSum FROM 1 BY 1 UNTIL NOT (i_totalSum < mat_totalSum.length)
      * System.out.println("Elements added: " + "row " + i + " col 0, " + "row 0 col " + i + ", row " + i + " col " + i);
      * System.out.println("Elements added: " + mat[i][0] + ", " + mat[0][i] + ", " + mat[i][i]);
       COMPUTE TEMP_0 = i_totalSum + 1
       COMPUTE TEMP_1 = TEMP_0 + 0
       COMPUTE sum_totalSum = TEMP_1
       COMPUTE TEMP_2 = 1 + i_totalSum
       COMPUTE sum_totalSum = TEMP_2
       COMPUTE TEMP_3 = i_totalSum + 1
       COMPUTE TEMP_4 = TEMP_3 + i_totalSum
       COMPUTE sum_totalSum = TEMP_4
       END-PERFORM
       COMPUTE TEMP_5 = mat_totalSum[0].length - 1
       PERFORM VARYING i_totalSum FROM 1 BY 1 UNTIL NOT (i_totalSum < TEMP_5)
      * System.out.println("Elements added: " + "row " + (mat[0].length-1) + " col " + i + ", row " + i + " col " + (mat[0].length-1));
      * System.out.println("Elements added: " + mat[mat[0].length-1][i] + ", " + mat[i][mat[0].length-1]);
       COMPUTE TEMP_6 = 0 + 1
       COMPUTE TEMP_7 = TEMP_6 + length
       COMPUTE TEMP_8 = 1 - i_totalSum
       COMPUTE sum_totalSum = TEMP_8
       COMPUTE TEMP_9 = i_totalSum + 1
       COMPUTE TEMP_10 = 1 + length
       COMPUTE TEMP_11 = TEMP_10 - 1
       COMPUTE sum_totalSum = TEMP_11
      * System.out.println(sum);
       COMPUTE TEMP_12 = mat_totalSum.length - 1
       PERFORM VARYING j_totalSum FROM 1 BY 1 UNTIL NOT (j_totalSum < TEMP_12)
       ADD i_totalSum TO j_totalSum GIVING TEMP_13
       IF TEMP_13 = (mat_totalSum.length - 1)  AND  i_totalSum != j_totalSum
      * System.out.println("Elements added: " + "row " + i + " col " + j);
       COMPUTE TEMP_14 = i_totalSum + 1
       COMPUTE TEMP_15 = TEMP_14 + j_totalSum
       COMPUTE sum_totalSum = TEMP_15
       END-IF
       COMPUTE TEMP_12 = mat_totalSum.length - 1
       END-PERFORM
       COMPUTE TEMP_5 = mat_totalSum[0].length - 1
       END-PERFORM
       DISPLAY sum_totalSum WITH NO ADVANCING
       END-IF
       EXIT.


