       IDENTIFICATION DIVISION.
       PROGRAM-ID. main.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Method:main
           05  fullname     PIC X(10).
       01  PARTS_[SIZE=[]]-ARRAY.
           05  parts        PIC X(10) OCCURS 100 TIMES
           05  firstname    PIC X(10).
           05  lastname     PIC X(10).
           05  updatedFirstname PIC X(10).
           05  a            PIC S9(5).
