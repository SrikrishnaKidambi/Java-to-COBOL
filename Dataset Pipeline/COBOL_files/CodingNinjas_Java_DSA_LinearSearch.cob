       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_LinearSearch.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_LINEARSEARCH_CLASS_LINEARSEARCH_GLOBAL
       01  ARR_LINEARSEARCH_-ARRAY.
           05  arr_linearSearch PIC S9(5) OCCURS 100 TIMES.
       01  x_linearSearch  PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_LINEARSEARCH_CLASS_LINEARSEARCH_GLOBAL
       01  i_linearSearch  PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       linearSearch-PARA.
      * Your code goes here
       PERFORM VARYING i_linearSearch FROM 0 BY 1 UNTIL NOT (i_linearSearch < arr_linearSearch.length)
       IF x_linearSearch = arr_linearSearch[i_linearSearch]
       END-IF
       END-PERFORM
       PERFORM return-PARA
       EXIT.


