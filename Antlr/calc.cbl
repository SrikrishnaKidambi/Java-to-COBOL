       IDENTIFICATION DIVISION.
       PROGRAM-ID. calc.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Method:calc
           05  a            PIC S9(5).
           05  b            PIC S9(5).
           05  sum          PIC S9(5).
           05  diff         PIC S9(5).
           05  prod         PIC S9(5).
           05  quot         PIC S9(5).
           05  rem          PIC S9(5).
       01  ARGS_[SIZE=[]]-ARRAY.
           05  args         PIC X(10) OCCURS 100 TIMES
