       IDENTIFICATION DIVISION.
       PROGRAM-ID. checkMember.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Method:checkMember
           05  a_checkMember PIC S9(5).
           05  b_checkMember PIC S9(5).
           05  c_checkMember PIC S9(5).
       01  ARGS_MAIN_[SIZE=[]]-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES
