       IDENTIFICATION DIVISION.
       PROGRAM-ID. convertToLowercase.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Method:convertToLowercase
           05  name_convertToLowercase PIC X(100).
       01  ARGS_MAIN_[SIZE=[]]-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES
