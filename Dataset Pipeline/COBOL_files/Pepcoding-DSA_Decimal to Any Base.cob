       IDENTIFICATION DIVISION.
       PROGRAM-ID. Pepcoding-DSA_Decimal to Any Base.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  scn_main        PIC X(100).
       01  n_main          PIC S9(5).
       01  b_main          PIC S9(5).
       01  dn_main         PIC S9(5).
      * Variables for Scope:METHOD_GETVALUEINBASE_CLASS_MAIN_GLOBAL
       01  n_getValueInBase PIC S9(5).
       01  b_getValueInBase PIC S9(5).
      * Variables for Scope:BLOCK_METHOD_GETVALUEINBASE_CLASS_MAIN_GLOBAL
       01  ans_getValueInBase PIC S9(5).
       01  power_getValueInBase PIC S9(5).
      * Variables for Scope:BLOCK_WHILE_BLOCK_METHOD_GETVALUEINBASE_CLASS_MAIN_GLOBAL
       01  r_getValueInBase PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       getValueInBase-PARA.
       MOVE 0 TO ans_getValueInBase
      * 10^0
       MOVE 1 TO power_getValueInBase
       PERFORM UNTIL NOT (n_getValueInBase NOT = 0)
       DIVIDE n_getValueInBase BY b_getValueInBase GIVING r_getValueInBase REMAINDER r_getValueInBase
       DIVIDE n_getValueInBase BY b_getValueInBase GIVING n_getValueInBase
       COMPUTE TEMP_0 = r_getValueInBase * power_getValueInBase
       COMPUTE TEMP_1 = ans_getValueInBase + TEMP_0
       COMPUTE ans_getValueInBase = TEMP_1
       MULTIPLY power_getValueInBase BY 10 GIVING power_getValueInBase
       END-PERFORM
       EXIT.


       MAIN-PARA.
      * Input from ODT is enabled
       ACCEPT n_main
       ACCEPT b_main
       MOVE getValueInBase(n_main, b_main) TO dn_main
       DISPLAY dn_main
       EXIT.


