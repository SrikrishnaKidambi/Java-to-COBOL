       IDENTIFICATION DIVISION.
       PROGRAM-ID. merge.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Method:merge
           05  i_merge      PIC S9(5).
           05  j_merge      PIC S9(5).
           05  k_merge      PIC S9(5).
       01  arr3_merge-ARRAY.
           05  arr3_merge   PIC S9(5) OCCURS 12 TIMES
