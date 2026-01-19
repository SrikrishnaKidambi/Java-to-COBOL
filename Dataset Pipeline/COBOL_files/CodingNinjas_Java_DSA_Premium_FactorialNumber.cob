       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_Premium_FactorialNumber.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_FACTORIAL_CLASS_FACTORIALNUMBER_GLOBAL
       01  num_factorial   PIC S9(5).
      * Variables for Scope:BLOCK_METHOD_FACTORIAL_CLASS_FACTORIALNUMBER_GLOBAL
       01  fact_factorial  PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_FACTORIAL_CLASS_FACTORIALNUMBER_GLOBAL
       01  i_factorial     PIC S9(5).
      * Variables for Scope:METHOD_MAIN_CLASS_FACTORIALNUMBER_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_FACTORIALNUMBER_GLOBAL
       01  s_main          PIC X(100).
       01  n_main          PIC S9(5).
       01  result_main     PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       factorial-PARA.
       MOVE 1 TO fact_factorial
       PERFORM VARYING i_factorial FROM 1 BY 1 UNTIL NOT (i_factorial <= num_factorial)
       MULTIPLY fact_factorial BY i_factorial GIVING fact_factorial
       END-PERFORM
       EXIT.


       MAIN-PARA.
      * TODO Auto-generated method stub
      * Input from ODT is enabled
       ACCEPT n_main
       MOVE factorial(n_main) TO result_main
       DISPLAY result_main
       EXIT.


