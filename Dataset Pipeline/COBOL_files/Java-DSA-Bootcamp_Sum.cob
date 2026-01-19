       IDENTIFICATION DIVISION.
       PROGRAM-ID. Java-DSA-Bootcamp_Sum.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_SUM_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_SUM_GLOBAL
       01  input_main      PIC X(100).
       01  num1_main       PIC S9(5)V9(2).
       01  num2_main       PIC S9(5)V9(2).
       01  sum_main        PIC S9(5)V9(2).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
       ACCEPT num1_main
       ACCEPT num2_main
       ADD num1_main TO num2_main GIVING sum_main
       DISPLAY "Sum = "
       DISPLAY sum_main
       EXIT.


