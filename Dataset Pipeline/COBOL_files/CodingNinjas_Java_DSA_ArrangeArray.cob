       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_ArrangeArray.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_ARRANGE_CLASS_ARRANGEARRAY_GLOBAL
       01  ARR_ARRANGE_-ARRAY.
           05  arr_arrange  PIC S9(5) OCCURS 100 TIMES.
       01  n_arrange       PIC S9(5).
      * Variables for Scope:BLOCK_METHOD_ARRANGE_CLASS_ARRANGEARRAY_GLOBAL
       01  idx_arrange     PIC S9(5).
       01  i_arrange       PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_ARRANGE_CLASS_ARRANGEARRAY_GLOBAL
       01  i_arrange       PIC S9(5).
       01 TEMP_0 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       arrange-PARA.
      * Your code goes here
       MOVE 0 TO idx_arrange
      * System.out.print(arr.length + " ");
       PERFORM VARYING i_arrange FROM 1 BY 1 UNTIL NOT (i_arrange <= n_arrange)
       COMPUTE arr_arrange(idx_arrange + 1) = i_arrange
      * System.out.print(arr[idx]+ " ");
       ADD idx_arrange TO 1 GIVING idx_arrange
       END-PERFORM
       DIVIDE n_arrange BY 2 GIVING TEMP_0 REMAINDER TEMP_0
       IF TEMP_0 = 0
       MOVE n_arrange TO i_arrange
       ELSE
       SUBTRACT 1 FROM n_arrange GIVING i_arrange
       END-IF
       COMPUTE arr_arrange(idx_arrange + 1) = i_arrange
      * System.out.print(arr[idx]+ " ");
       ADD idx_arrange TO 1 GIVING idx_arrange
       EXIT.


