       IDENTIFICATION DIVISION.
       PROGRAM-ID. java-dsa-bootcamp_Que16.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_FACT_CLASS_QUE16_GLOBAL
       01  num_fact        PIC S9(5).
      * Variables for Scope:BLOCK_METHOD_FACT_CLASS_QUE16_GLOBAL
       01  f_fact          PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_FACT_CLASS_QUE16_GLOBAL
       01  i_fact          PIC S9(5).
      * Variables for Scope:METHOD_MAIN_CLASS_QUE16_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_QUE16_GLOBAL
       01  sc_main         PIC X(100).
       01  n_main          PIC S9(5).
       01  r_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).
       01 TEMP_4 PIC S9(9).
       01 TEMP_5 PIC S9(9).
       01 TEMP_6 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       fact-PARA.
       MOVE 1 TO f_fact
       PERFORM VARYING i_fact FROM 1 BY 1 UNTIL NOT (i_fact <= num_fact)
       MULTIPLY f_fact BY i_fact GIVING f_fact
       END-PERFORM
       EXIT.


       MAIN-PARA.
      * Input from ODT is enabled
       DISPLAY "Enter value of n: "
       ACCEPT n_main
       DISPLAY "Enter value of r: "
       ACCEPT r_main
       IF n_main >= r_main
       DISPLAY n_main
       DISPLAY "c"
       DISPLAY r_main
       DISPLAY ": "
       COMPUTE TEMP_1 = n_main - r_main
       COMPUTE TEMP_2 = fact * r_main
       COMPUTE TEMP_3 = TEMP_1 / TEMP_2
       COMPUTE TEMP_0 = TEMP_3
       DISPLAY TEMP_0
       DISPLAY n_main
       DISPLAY "p"
       DISPLAY r_main
       DISPLAY ": "
       COMPUTE TEMP_5 = n_main - r_main
       COMPUTE TEMP_6 = fact / TEMP_5
       COMPUTE TEMP_4 = TEMP_6
       DISPLAY TEMP_4
       END-IF
       EXIT.


