       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_ReturnArraySum.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_SUM_CLASS_RETURNARRAYSUM_GLOBAL
       01  ARR_SUM_-ARRAY .
           05  arr_sum      PIC S9(5) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_SUM_CLASS_RETURNARRAYSUM_GLOBAL
       01  sum_sum         PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_SUM_CLASS_RETURNARRAYSUM_GLOBAL
       01  j_sum           PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       sum-PARA.
      * Your code goes here
       MOVE 0 TO sum_sum
       PERFORM VARYING j_sum FROM 0 BY 1 UNTIL NOT (j_sum < arr_sum.length)
       COMPUTE TEMP_0 = j_sum + 1
       COMPUTE TEMP_1 = arr_sum + TEMP_0
       COMPUTE sum_sum = TEMP_1
       END-PERFORM
       EXIT.


