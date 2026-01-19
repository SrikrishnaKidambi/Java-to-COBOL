       IDENTIFICATION DIVISION.
       PROGRAM-ID. printFahrenheitTable.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Method:printFahrenheitTable
           05  fahrenheight_printFahrenheitTable PIC S9(5).
           05  celcius_printFahrenheitTable PIC S9(5).
       01  ARGS_MAIN_[SIZE=[]]-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES
