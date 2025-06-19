       IDENTIFICATION DIVISION.
       PROGRAM-ID. displayMax.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Method:displayMax
           05  a_displayMax PIC S9(5).
           05  b_displayMax PIC S9(5).
           05  max_displayMax PIC S9(5).
       01  ARGS_MAIN_[SIZE=[]]-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES
