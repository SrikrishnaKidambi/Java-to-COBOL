       IDENTIFICATION DIVISION.
       PROGRAM-ID. displayExponential.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Method:displayExponential
           05  base_displayExponential PIC S9(5)V9(2).
           05  val_displayExponential PIC S9(5)V9(2).
       01  ARGS_MAIN_[SIZE=[]]-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES
