       IDENTIFICATION DIVISION.
       PROGRAM-ID. printSignClassification.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Method:printSignClassification
           05  n            PIC S9(5).
       01  ARGS_[SIZE=[]]-ARRAY.
           05  args         PIC X(10) OCCURS 100 TIMES
