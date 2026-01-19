       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_IntegralSquareRoot.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_INTEGRALSQUAREROOT_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_INTEGRALSQUAREROOT_GLOBAL
       01  scan_main       PIC X(100).
       01  N_main          PIC S9(5).
      * Variables for Scope:BLOCK_IF_BLOCK_METHOD_MAIN_CLASS_INTEGRALSQUAREROOT_GLOBAL
       01  num_main        PIC S9(5)V9(2).
       01  half_main       PIC S9(5)V9(2).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).
       01 TEMP_4 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Write your code here
      * Input from ODT is enabled
       ACCEPT N_main
       IF N_main = 0
       DISPLAY "0"
       ELSE
       COMPUTE TEMP_0 = N_main / 2
       COMPUTE half_main = TEMP_0
       PERFORM WITH TEST AFTER
       MOVE half_main TO num_main
       COMPUTE TEMP_2 = N_main / num_main
       COMPUTE TEMP_3 = num_main + TEMP_2
       COMPUTE TEMP_4 = TEMP_3 / 2
       COMPUTE half_main = TEMP_4
       COMPUTE TEMP_1 = (num_main - half_main)
       END-PERFORM UNTIL NOT (TEMP_1 NOT = 0)
       DISPLAY FUNCTION INTEGER(half_main)
       END-IF
       EXIT.


