       IDENTIFICATION DIVISION.
       PROGRAM-ID. probability.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Method:probability
           05  favourableOutcome_probability PIC S9(5).
           05  totalOutcome_probability PIC S9(5).
           05  ans_probability PIC S9(5).
       01  ARGS_MAIN_[SIZE=[]]-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES
