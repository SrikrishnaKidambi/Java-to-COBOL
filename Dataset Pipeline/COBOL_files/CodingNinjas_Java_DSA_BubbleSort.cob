       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_BubbleSort.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_BUBBLESORT_CLASS_BUBBLESORT_GLOBAL
       01  ARR_BUBBLESORT_-ARRAY.
           05  arr_bubbleSort PIC S9(5) OCCURS 100 TIMES.
      * Variables for Scope:FOR_BLOCK_METHOD_BUBBLESORT_CLASS_BUBBLESORT_GLOBAL
       01  i_bubbleSort    PIC S9(5).
      * Variables for Scope:FOR_BLOCK_FOR_BLOCK_METHOD_BUBBLESORT_CLASS_BUBBLESORT_GLOBAL
       01  j_bubbleSort    PIC S9(5).
      * Variables for Scope:BLOCK_IF_BLOCK_FOR_BLOCK_FOR_BLOCK_METHOD_BUBBLESORT_CLASS_BUBBLESORT_GLOBAL
       01  temp_bubbleSort PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       bubbleSort-PARA.
      * Your code goes here
       PERFORM VARYING i_bubbleSort FROM 0 BY 1 UNTIL NOT (i_bubbleSort < arr_bubbleSort.length)
       COMPUTE TEMP_0 = arr_bubbleSort.length - i_bubbleSort - 1
       PERFORM VARYING j_bubbleSort FROM 0 BY 1 UNTIL NOT (j_bubbleSort < TEMP_0)
       IF arr_bubbleSort[j_bubbleSort] > arr_bubbleSort[j_bubbleSort + 1]
       MOVE arr_bubbleSort(j_bubbleSort + 1) TO temp_bubbleSort
       COMPUTE TEMP_1 = j_bubbleSort + 1
       COMPUTE TEMP_2 = TEMP_1 + 1
       COMPUTE arr_bubbleSort(j_bubbleSort + 1) = TEMP_2
       COMPUTE arr_bubbleSort(j_bubbleSort + 1 + 1) = temp_bubbleSort
       END-IF
       COMPUTE TEMP_0 = arr_bubbleSort.length - i_bubbleSort - 1
       END-PERFORM
       END-PERFORM
       EXIT.


