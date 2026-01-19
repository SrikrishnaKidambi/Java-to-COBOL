       IDENTIFICATION DIVISION.
       PROGRAM-ID. Pepcoding-DSA_Inverse of No.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  scn_main        PIC X(100).
       01  n_main          PIC S9(5).
       01  num_main        PIC S9(5).
       01  nod_main        PIC S9(5).
       01  ans_main        PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  i_main          PIC S9(5).
      * Variables for Scope:BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  ld_main         PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
       ACCEPT n_main
       MOVE n_main TO num_main
       MOVE 0 TO nod_main
       PERFORM UNTIL NOT (num_main NOT = 0)
       DIVIDE num_main BY 10 GIVING num_main
       ADD 1 TO nod_main
       END-PERFORM
       MOVE 0 TO ans_main
       PERFORM VARYING i_main FROM 1 BY 1 UNTIL NOT (i_main <= nod_main)
       DIVIDE n_main BY 10 GIVING ld_main REMAINDER ld_main
       DIVIDE n_main BY 10 GIVING n_main
       COMPUTE TEMP_0 = ld_main - 1
       COMPUTE TEMP_1 = 10 * TEMP_0
       COMPUTE TEMP_2 = pow + TEMP_1
       COMPUTE ans_main = TEMP_2
       END-PERFORM
       DISPLAY ans_main
       EXIT.


