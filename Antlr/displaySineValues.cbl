       IDENTIFICATION DIVISION.
       PROGRAM-ID. displaySineValues.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Method:displaySineValues
           05  i_displaySineValues PIC S9(5).
           05  angle_displaySineValues PIC S9(5)V9(2).
           05  val_displaySineValues PIC S9(5)V9(2).
       01  ARGS_MAIN_[SIZE=[]]-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES
