       IDENTIFICATION DIVISION.
       PROGRAM-ID. reverseString.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Method:reverseString
           05  original_reverseString PIC X(100).
           05  reversed_reverseString PIC X(100).
       01  ARGS_MAIN_[SIZE=[]]-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES
