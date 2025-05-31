       IDENTIFICATION DIVISION.
       PROGRAM-ID. sayHello.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Method:sayHello
           05  msg_sayHello PIC X(10).
       01  ARGS_[SIZE=[]]-ARRAY.
           05  args         PIC X(10) OCCURS 100 TIMES
