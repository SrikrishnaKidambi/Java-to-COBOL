       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_SelectionSort.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_SELECTIONSORT_CLASS_SELECTIONSORT_GLOBAL
       01  ARR_SELECTIONSORT_-ARRAY.
           05  arr_selectionSort PIC S9(5) OCCURS 100 TIMES.
      * Variables for Scope:FOR_BLOCK_METHOD_SELECTIONSORT_CLASS_SELECTIONSORT_GLOBAL
       01  i_selectionSort PIC S9(5).
      * Variables for Scope:BLOCK_FOR_BLOCK_METHOD_SELECTIONSORT_CLASS_SELECTIONSORT_GLOBAL
       01  min_idx_selectionSort PIC S9(5).
       01  temp_selectionSort PIC S9(5).
      * Variables for Scope:FOR_BLOCK_FOR_BLOCK_METHOD_SELECTIONSORT_CLASS_SELECTIONSORT_GLOBAL
       01  j_selectionSort PIC S9(5).
       01 TEMP_0 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       selectionSort-PARA.
      * Your code goes here
       PERFORM VARYING i_selectionSort FROM 0 BY 1 UNTIL NOT (i_selectionSort < arr_selectionSort.length)
       MOVE i_selectionSort TO min_idx_selectionSort
       PERFORM VARYING j_selectionSort FROM i_selectionSort BY 1 UNTIL NOT (j_selectionSort < arr_selectionSort.length)
       ADD i_selectionSort TO 1 GIVING j_selectionSort
       IF arr_selectionSort[j_selectionSort] < arr_selectionSort[min_idx_selectionSort]
       MOVE j_selectionSort TO min_idx_selectionSort
       END-IF
       END-PERFORM
       MOVE arr_selectionSort(i_selectionSort + 1) TO temp_selectionSort
       COMPUTE TEMP_0 = min_idx_selectionSort + 1
       COMPUTE arr_selectionSort(i_selectionSort + 1) = TEMP_0
       COMPUTE arr_selectionSort(min_idx_selectionSort + 1) = temp_selectionSort
       END-PERFORM
       EXIT.


