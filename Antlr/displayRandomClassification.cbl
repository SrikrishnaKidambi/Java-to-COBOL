       IDENTIFICATION DIVISION.
       PROGRAM-ID. displayRandomClassification.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Method:displayRandomClassification
           05  rand_displayRandomClassification PIC S9(5)V9(2).
       01  ARGS_MAIN_[SIZE=[]]-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES
