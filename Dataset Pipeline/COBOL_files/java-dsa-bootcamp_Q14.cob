       IDENTIFICATION DIVISION.
       PROGRAM-ID. java-dsa-bootcamp_Q14.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_Q14_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_Q14_GLOBAL
       01  sum_main        PIC S9(5)V9(2).
       01  in_main         PIC X(100).
       01  num_main        PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_Q14_GLOBAL
       01  i_main          PIC S9(5).
      * Variables for Scope:BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_Q14_GLOBAL
       01  numbers_main    PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 0 TO sum_main
      * Input from ODT is enabled
       DISPLAY "Please enter how many number: "
       ACCEPT num_main
       DISPLAY "Please enter numbers: "
       PERFORM VARYING i_main FROM 1 BY 1 UNTIL NOT (i_main <= num_main)
       ACCEPT numbers_main
       ADD sum_main TO numbers_main GIVING sum_main
       END-PERFORM
       DISPLAY "Sum of "
       DISPLAY num_main
       DISPLAY " is :"
       DISPLAY sum_main
       EXIT.


