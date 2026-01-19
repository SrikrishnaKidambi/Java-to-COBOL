       IDENTIFICATION DIVISION.
       PROGRAM-ID. java-dsa-bootcamp_Q1.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_Q1_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_Q1_GLOBAL
       01  in_main         PIC X(100).
       01  n_main          PIC S9(5).
       01  fact_main       PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_Q1_GLOBAL
       01  i_main          PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * factorial program
      * Input from ODT is enabled
       DISPLAY "Enter a number: " WITH NO ADVANCING
       ACCEPT n_main
       MOVE 1 TO fact_main
       PERFORM VARYING i_main FROM 1 BY 1 UNTIL NOT (i_main <= n_main)
       MULTIPLY fact_main BY i_main GIVING fact_main
       END-PERFORM
       DISPLAY "Factorial of "
       DISPLAY n_main
       DISPLAY " is "
       DISPLAY fact_main
       EXIT.


