       IDENTIFICATION DIVISION.
       PROGRAM-ID. Pepcoding-DSA_Benjamin Bulbs.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  scn_main        PIC X(100).
       01  n_main          PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  i_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
       ACCEPT n_main
       COMPUTE TEMP_0 = i_main * i_main
       PERFORM VARYING i_main FROM 1 BY 1 UNTIL NOT (TEMP_0 <= n_main)
       MULTIPLY i_main BY i_main GIVING TEMP_1
       DISPLAY TEMP_1
       COMPUTE TEMP_0 = i_main * i_main
       END-PERFORM
       EXIT.


