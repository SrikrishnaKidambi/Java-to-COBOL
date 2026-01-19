       IDENTIFICATION DIVISION.
       PROGRAM-ID. java-dsa-bootcamp_Q11.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  sc_main         PIC X(100).
       01  p_main          PIC S9(5)V9(2).
       01  rate_main       PIC S9(5)V9(2).
       01  time_main       PIC S9(5)V9(2).
      * Variables for Scope:METHOD_COMPOUNDINTEREST_CLASS_MAIN_GLOBAL
       01  p_compoundInterest PIC S9(5)V9(2).
       01  rate_compoundInterest PIC S9(5)V9(2).
       01  time_compoundInterest PIC S9(5)V9(2).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       compoundInterest-PARA.
       EXIT.


       MAIN-PARA.
      * Input from ODT is enabled
       DISPLAY "Enter Principal Amount"
       ACCEPT p_main
       DISPLAY "Enter Rate of interest"
       ACCEPT rate_main
       DISPLAY "Enter time"
       ACCEPT time_main
       DISPLAY compoundInterest(p_main, rate_main, time_main)
       EXIT.


