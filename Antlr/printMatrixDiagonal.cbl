       IDENTIFICATION DIVISION.
       PROGRAM-ID. printMatrixDiagonal.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Method:printMatrixDiagonal
           05  row_printMatrixDiagonal PIC S9(5).
           05  col_printMatrixDiagonal PIC S9(5).
       01  ARGS_MAIN_[SIZE=[]]-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES
