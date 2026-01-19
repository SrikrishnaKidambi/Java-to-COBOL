       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_Premium_PowerOfNumber.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_POWEROFNUMBER_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_POWEROFNUMBER_GLOBAL
       01  s_main          PIC X(100).
       01  x_main          PIC S9(5).
       01  n_main          PIC S9(5).
       01  ans_main        PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * TODO Auto-generated method stub
      * Input from ODT is enabled
       ACCEPT x_main
       ACCEPT n_main
       MOVE 1 TO ans_main
       PERFORM UNTIL NOT (n_main > 0)
       MULTIPLY ans_main BY x_main GIVING ans_main
       SUBTRACT 1 FROM n_main
       END-PERFORM
       DISPLAY ans_main
       EXIT.


