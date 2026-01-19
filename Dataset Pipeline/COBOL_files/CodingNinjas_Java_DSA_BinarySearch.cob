       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_BinarySearch.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_BINARYSEARCH_CLASS_BINARYSEARCH_GLOBAL
       01  ARR_BINARYSEARCH_-ARRAY.
           05  arr_binarySearch PIC S9(5) OCCURS 100 TIMES.
       01  x_binarySearch  PIC S9(5).
      * Variables for Scope:BLOCK_METHOD_BINARYSEARCH_CLASS_BINARYSEARCH_GLOBAL
       01  s_binarySearch  PIC S9(5).
       01  e_binarySearch  PIC S9(5).
      * Variables for Scope:BLOCK_WHILE_BLOCK_METHOD_BINARYSEARCH_CLASS_BINARYSEARCH_GLOBAL
       01  m_binarySearch  PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       binarySearch-PARA.
      * Your code goes here
       MOVE 0 TO s_binarySearch
       COMPUTE TEMP_0 = length - 1
       COMPUTE e_binarySearch = TEMP_0
       PERFORM UNTIL NOT (s_binarySearch <= e_binarySearch)
       COMPUTE TEMP_1 = s_binarySearch + e_binarySearch
       COMPUTE TEMP_2 = TEMP_1 / 2
       COMPUTE m_binarySearch = TEMP_2
      * System.out.println("Mid element: "+arr[m]);
       IF arr_binarySearch[m_binarySearch] < x_binarySearch
       ADD m_binarySearch TO 1 GIVING s_binarySearch
       ELSE
       IF arr_binarySearch[m_binarySearch] > x_binarySearch
       SUBTRACT 1 FROM m_binarySearch GIVING e_binarySearch
       ELSE
       END-IF
       END-IF
       END-PERFORM
       EXIT.


