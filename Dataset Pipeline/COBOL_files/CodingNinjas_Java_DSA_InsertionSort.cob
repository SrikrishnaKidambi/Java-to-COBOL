       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_InsertionSort.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_INSERTIONSORT_CLASS_INSERTIONSORT_GLOBAL
       01  ARR_INSERTIONSORT_-ARRAY.
           05  arr_insertionSort PIC S9(5) OCCURS 100 TIMES.
      * Variables for Scope:FOR_BLOCK_METHOD_INSERTIONSORT_CLASS_INSERTIONSORT_GLOBAL
       01  i_insertionSort PIC S9(5).
      * Variables for Scope:BLOCK_FOR_BLOCK_METHOD_INSERTIONSORT_CLASS_INSERTIONSORT_GLOBAL
       01  val_insertionSort PIC S9(5).
       01  j_insertionSort PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       insertionSort-PARA.
      * Your code goes here
       PERFORM VARYING i_insertionSort FROM 1 BY 1 UNTIL NOT (i_insertionSort < arr_insertionSort.length)
       MOVE arr_insertionSort(i_insertionSort + 1) TO val_insertionSort
       SUBTRACT 1 FROM i_insertionSort GIVING j_insertionSort
       COMPUTE TEMP_0 = -1
       PERFORM UNTIL NOT (j_insertionSort > TEMP_0  AND  arr_insertionSort[j_insertionSort] > val_insertionSort)
       COMPUTE TEMP_1 = j_insertionSort + 1
       COMPUTE arr_insertionSort(j_insertionSort + 1 + 1) = TEMP_1
       SUBTRACT 1 FROM j_insertionSort
       COMPUTE TEMP_0 = -1
       END-PERFORM
       COMPUTE arr_insertionSort(j_insertionSort + 1 + 1) = val_insertionSort
       END-PERFORM
       EXIT.


