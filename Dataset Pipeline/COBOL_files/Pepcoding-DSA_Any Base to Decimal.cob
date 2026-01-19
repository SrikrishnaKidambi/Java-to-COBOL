       IDENTIFICATION DIVISION.
       PROGRAM-ID. Pepcoding-DSA_Any Base to Decimal.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  scn_main        PIC X(100).
       01  n_main          PIC S9(5).
       01  b_main          PIC S9(5).
       01  d_main          PIC S9(5).
      * Variables for Scope:METHOD_GETVALUEINDECIMAL_CLASS_MAIN_GLOBAL
       01  n_getValueIndecimal PIC S9(5).
       01  b_getValueIndecimal PIC S9(5).
      * Variables for Scope:BLOCK_METHOD_GETVALUEINDECIMAL_CLASS_MAIN_GLOBAL
       01  ans_getValueIndecimal PIC S9(5).
       01  power_getValueIndecimal PIC S9(5).
      * Variables for Scope:BLOCK_WHILE_BLOCK_METHOD_GETVALUEINDECIMAL_CLASS_MAIN_GLOBAL
       01  ld_getValueIndecimal PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       getValueIndecimal-PARA.
       MOVE 0 TO ans_getValueIndecimal
      * b^0
       MOVE 1 TO power_getValueIndecimal
       PERFORM UNTIL NOT (n_getValueIndecimal NOT = 0)
       DIVIDE n_getValueIndecimal BY 10 GIVING ld_getValueIndecimal REMAINDER ld_getValueIndecimal
       DIVIDE n_getValueIndecimal BY 10 GIVING n_getValueIndecimal
       COMPUTE TEMP_0 = ld_getValueIndecimal * power_getValueIndecimal
       COMPUTE TEMP_1 = ans_getValueIndecimal + TEMP_0
       COMPUTE ans_getValueIndecimal = TEMP_1
       MULTIPLY power_getValueIndecimal BY b_getValueIndecimal GIVING power_getValueIndecimal
       END-PERFORM
       EXIT.


       MAIN-PARA.
      * Input from ODT is enabled
       ACCEPT n_main
       ACCEPT b_main
       MOVE getValueIndecimal(n_main, b_main) TO d_main
       DISPLAY d_main
       EXIT.


