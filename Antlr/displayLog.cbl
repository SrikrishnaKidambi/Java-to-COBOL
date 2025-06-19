       IDENTIFICATION DIVISION.
       PROGRAM-ID. displayLog.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Method:displayLog
           05  x_displayLog PIC S9(5)V9(2).
           05  val_displayLog PIC S9(5)V9(2).
       01  ARGS_MAIN_[SIZE=[]]-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES
