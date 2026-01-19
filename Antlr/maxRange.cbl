       IDENTIFICATION DIVISION.
       PROGRAM-ID. maxRange.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Method:maxRange
           05  maxVal_maxRange PIC S9(5).
           05  i_maxRange   PIC S9(5).
       01  ARR_MAX_[SIZE=[]]-ARRAY.
           05  arr_max      PIC S9(5) OCCURS 100 TIMES
