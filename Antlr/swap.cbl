       IDENTIFICATION DIVISION.
       PROGRAM-ID. swap.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Method:swap
           05  temp_swap    PIC S9(5).
       01  ARR_REVERSE_[SIZE=[]]-ARRAY.
           05  arr_reverse  PIC S9(5) OCCURS 100 TIMES
           05  left_reverse PIC S9(5).
           05  right_reverse PIC S9(5).
       01  A_ROTATE_[SIZE=[]]-ARRAY.
           05  a_rotate     PIC S9(5) OCCURS 100 TIMES
           05  k_rotate     PIC S9(5).
