       IDENTIFICATION DIVISION.
       PROGRAM-ID. java-dsa-bootcamp_Q13.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_Q13_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_Q13_GLOBAL
       01  n1_main         PIC S9(5).
       01  n2_main         PIC S9(5).
       01  sum_main        PIC S9(5).
       01  sc_main         PIC X(100).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
       DISPLAY "Enter First Number: "
       ACCEPT n1_main
       DISPLAY "Enter Second Number: "
       ACCEPT n2_main
       ADD n1_main TO n2_main GIVING sum_main
       DISPLAY "Sum of these numbers: "
       DISPLAY sum_main
       EXIT.


