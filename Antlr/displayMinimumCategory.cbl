       IDENTIFICATION DIVISION.
       PROGRAM-ID. displayMinimumCategory.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Method:displayMinimumCategory
           05  a_displayMinimumCategory PIC S9(5).
           05  b_displayMinimumCategory PIC S9(5).
           05  min_displayMinimumCategory PIC S9(5).
       01  ARGS_MAIN_[SIZE=[]]-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES
