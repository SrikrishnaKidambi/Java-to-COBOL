       IDENTIFICATION DIVISION.
       PROGRAM-ID. .


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Method:
           05  x_calc       PIC S9(5).
           05  y_calc       PIC S9(5).
       01  ARGS_[SIZE=[]]-ARRAY.
           05  args         PIC X(100) OCCURS 100 TIMES
