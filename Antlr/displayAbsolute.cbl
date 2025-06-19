       IDENTIFICATION DIVISION.
       PROGRAM-ID. displayAbsolute.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Method:displayAbsolute
           05  input_displayAbsolute PIC X(100).
           05  value_displayAbsolute PIC S9(5).
       01  ARGS_MAIN_[SIZE=[]]-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES
