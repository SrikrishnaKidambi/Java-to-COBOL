       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_Premium_SumofNNumbers.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_SUMOFNNUMBERS_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_SUMOFNNUMBERS_GLOBAL
       01  s_main          PIC X(100).
       01  n_main          PIC S9(5).
       01  i_main          PIC S9(5).
       01  sum_main        PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * TODO Auto-generated method stub
      * Input from ODT is enabled
       ACCEPT n_main
       MOVE 1 TO i_main
       MOVE 0 TO sum_main
       PERFORM UNTIL NOT (i_main <= n_main)
      * prints i for every step.
       DISPLAY i_main
       ADD sum_main TO i_main GIVING sum_main
       ADD i_main TO 1 GIVING i_main
       END-PERFORM
      * prints sum
       DISPLAY sum_main
       EXIT.


