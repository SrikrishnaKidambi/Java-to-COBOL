       IDENTIFICATION DIVISION.
       PROGRAM-ID. DigitCounter.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TESTSCOPED_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TESTSCOPED_GLOBAL
       01  sc_main         PIC X(100).
       01  num_main        PIC S9(5).
       01  count_main      PIC S9(5).



       MAIN-PARA.
      * Input from ODT is enabled
       DISPLAY "Enter number: " WITH NO ADVANCING
       ACCEPT num_main
       MOVE 0 TO count_main
       PERFORM UNTIL NOT (num_main NOT= 0)
       ADD 1 TO count_main
       DIVIDE num_main BY 10 GIVING num_main
       END-PERFORM
       DISPLAY "Number of digits: "   count_main
       STOP RUN.

