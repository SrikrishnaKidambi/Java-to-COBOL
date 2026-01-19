       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_MergeSortedArrays.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MERGE_CLASS_MERGESORTEDARRAYS_GLOBAL
       01  ARR1_MERGE_-ARRAY.
           05  arr1_merge   PIC S9(5) OCCURS 100 TIMES.
       01  ARR2_MERGE_-ARRAY.
           05  arr2_merge   PIC S9(5) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MERGE_CLASS_MERGESORTEDARRAYS_GLOBAL
       01  i_merge         PIC S9(5).
       01  j_merge         PIC S9(5).
       01  k_merge         PIC S9(5).
       01  arr3_merge-ARRAY.
           05  arr3_merge   PIC S9(5) OCCURS 12 TIMES.
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).
       01 TEMP_4 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       merge-PARA.
      * Your code goes here
       COMPUTE TEMP_0 = (arr1_merge.length + arr2_merge.length)
       PERFORM VARYING k_merge FROM 0 BY 1 UNTIL NOT (k_merge < TEMP_0)
       IF i_merge >= arr1_merge.length
       COMPUTE TEMP_1 = j_merge + 1
       COMPUTE arr3_merge(k_merge + 1) = TEMP_1
       ADD 1 TO j_merge
       ELSE
       IF j_merge >= arr2_merge.length
       COMPUTE TEMP_2 = i_merge + 1
       COMPUTE arr3_merge(k_merge + 1) = TEMP_2
       ADD 1 TO i_merge
       ELSE
       IF arr1_merge[i_merge] < arr2_merge[j_merge]
       COMPUTE TEMP_3 = i_merge + 1
       COMPUTE arr3_merge(k_merge + 1) = TEMP_3
       ADD 1 TO i_merge
       ELSE
       COMPUTE TEMP_4 = j_merge + 1
       COMPUTE arr3_merge(k_merge + 1) = TEMP_4
       ADD 1 TO j_merge
       END-IF
       END-IF
       END-IF
       COMPUTE TEMP_0 = (arr1_merge.length + arr2_merge.length)
       END-PERFORM
       EXIT.


