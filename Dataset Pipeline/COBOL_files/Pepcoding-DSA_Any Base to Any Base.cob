       IDENTIFICATION DIVISION.
       PROGRAM-ID. Pepcoding-DSA_Any Base to Any Base.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  scn_main        PIC X(100).
       01  n_main          PIC S9(5).
       01  b1_main         PIC S9(5).
       01  b2_main         PIC S9(5).
       01  d_main          PIC S9(5).
      * Variables for Scope:METHOD_GETVALUE_CLASS_MAIN_GLOBAL
       01  n_getValue      PIC S9(5).
       01  b1_getValue     PIC S9(5).
       01  b2_getValue     PIC S9(5).
      * Variables for Scope:BLOCK_METHOD_GETVALUE_CLASS_MAIN_GLOBAL
       01  d1_getValue     PIC S9(5).
       01  d2_getValue     PIC S9(5).
      * Variables for Scope:METHOD_ANYBASETODECIMAL_CLASS_MAIN_GLOBAL
       01  n_anyBaseToDecimal PIC S9(5).
       01  b_anyBaseToDecimal PIC S9(5).
      * Variables for Scope:BLOCK_METHOD_ANYBASETODECIMAL_CLASS_MAIN_GLOBAL
       01  rv_anyBaseToDecimal PIC S9(5).
       01  p_anyBaseToDecimal PIC S9(5).
      * Variables for Scope:BLOCK_WHILE_BLOCK_METHOD_ANYBASETODECIMAL_CLASS_MAIN_GLOBAL
       01  d_anyBaseToDecimal PIC S9(5).
      * Variables for Scope:METHOD_DECIMALTOANYBASE_CLASS_MAIN_GLOBAL
       01  n_decimalToAnyBase PIC S9(5).
       01  b_decimalToAnyBase PIC S9(5).
      * Variables for Scope:BLOCK_METHOD_DECIMALTOANYBASE_CLASS_MAIN_GLOBAL
       01  rv_decimalToAnyBase PIC S9(5).
       01  p_decimalToAnyBase PIC S9(5).
      * Variables for Scope:BLOCK_WHILE_BLOCK_METHOD_DECIMALTOANYBASE_CLASS_MAIN_GLOBAL
       01  d_decimalToAnyBase PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       getValue-PARA.
       MOVE anyBaseToDecimal(n_getValue, b1_getValue) TO d1_getValue
       MOVE decimalToAnyBase(d1_getValue, b2_getValue) TO d2_getValue
       EXIT.


       anyBaseToDecimal-PARA.
       MOVE 0 TO rv_anyBaseToDecimal
       MOVE 1 TO p_anyBaseToDecimal
       PERFORM UNTIL NOT (n_anyBaseToDecimal > 0)
       DIVIDE n_anyBaseToDecimal BY 10 GIVING d_anyBaseToDecimal REMAINDER d_anyBaseToDecimal
       DIVIDE n_anyBaseToDecimal BY 10 GIVING n_anyBaseToDecimal
       COMPUTE TEMP_0 = p_anyBaseToDecimal * d_anyBaseToDecimal
       COMPUTE TEMP_1 = rv_anyBaseToDecimal + TEMP_0
       COMPUTE rv_anyBaseToDecimal = TEMP_1
       MULTIPLY p_anyBaseToDecimal BY b_anyBaseToDecimal GIVING p_anyBaseToDecimal
       END-PERFORM
       EXIT.


       decimalToAnyBase-PARA.
       MOVE 0 TO rv_decimalToAnyBase
       MOVE 1 TO p_decimalToAnyBase
       PERFORM UNTIL NOT (n_decimalToAnyBase > 0)
       DIVIDE n_decimalToAnyBase BY b_decimalToAnyBase GIVING d_decimalToAnyBase REMAINDER d_decimalToAnyBase
       DIVIDE n_decimalToAnyBase BY b_decimalToAnyBase GIVING n_decimalToAnyBase
       COMPUTE TEMP_2 = p_decimalToAnyBase * d_decimalToAnyBase
       COMPUTE TEMP_3 = rv_decimalToAnyBase + TEMP_2
       COMPUTE rv_decimalToAnyBase = TEMP_3
       MULTIPLY p_decimalToAnyBase BY 10 GIVING p_decimalToAnyBase
       END-PERFORM
       EXIT.


       MAIN-PARA.
      * Input from ODT is enabled
       ACCEPT n_main
       ACCEPT b1_main
       ACCEPT b2_main
       MOVE getValue(n_main, b1_main, b2_main) TO d_main
       DISPLAY d_main
       EXIT.


