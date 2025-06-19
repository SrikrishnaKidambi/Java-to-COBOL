       IDENTIFICATION DIVISION.
       PROGRAM-ID. convertToUppercase.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Method:convertToUppercase
           05  lang_convertToUppercase PIC X(100).
       01  ARGS_MAIN_[SIZE=[]]-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES
