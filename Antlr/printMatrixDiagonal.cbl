       IDENTIFICATION DIVISION.
       PROGRAM-ID. printMatrixDiagonal.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Method:printMatrixDiagonal
           05  row          PIC S9(5).
           05  col          PIC S9(5).
       01  ARGS_[SIZE=[]]-ARRAY.
           05  args         PIC X(10) OCCURS 100 TIMES
