       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_PairSum.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_PAIRSUM_CLASS_PAIRSUM_GLOBAL
       01  ARR_PAIRSUM_-ARRAY.
           05  arr_pairSum  PIC S9(5) OCCURS 100 TIMES.
       01  x_pairSum       PIC S9(5).
      * Variables for Scope:BLOCK_METHOD_PAIRSUM_CLASS_PAIRSUM_GLOBAL
       01  count_pairSum   PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_PAIRSUM_CLASS_PAIRSUM_GLOBAL
       01  i_pairSum       PIC S9(5).
      * Variables for Scope:FOR_BLOCK_FOR_BLOCK_METHOD_PAIRSUM_CLASS_PAIRSUM_GLOBAL
       01  j_pairSum       PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       pairSum-PARA.
      * Your code goes here
       MOVE 0 TO count_pairSum
       PERFORM VARYING i_pairSum FROM 0 BY 1 UNTIL NOT (i_pairSum < arr_pairSum.length)
       PERFORM VARYING j_pairSum FROM 0 BY 1 UNTIL NOT (j_pairSum < arr_pairSum.length)
       IF i_pairSum != j_pairSum
       COMPUTE TEMP_1 = i_pairSum + 1
       COMPUTE TEMP_2 = j_pairSum + 1
       COMPUTE TEMP_3 = arr_pairSum + TEMP_2
       COMPUTE TEMP_0 = TEMP_3
       IF TEMP_0 = x_pairSum
       ADD 1 TO count_pairSum
       END-IF
       END-IF
       END-PERFORM
       END-PERFORM
       PERFORM return-PARA
       EXIT.


