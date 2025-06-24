       IDENTIFICATION DIVISION.
       PROGRAM-ID. displaySquareRoots.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Method:displaySquareRoots
           05  i_displaySquareRoots PIC S9(5).
           05  val_displaySquareRoots PIC S9(5)V9(2).
       01  ARGS_MAIN_[SIZE=[]]-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES
