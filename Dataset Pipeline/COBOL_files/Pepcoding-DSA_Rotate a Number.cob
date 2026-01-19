       IDENTIFICATION DIVISION.
       PROGRAM-ID. Pepcoding-DSA_Rotate a Number.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  scn_main        PIC X(100).
       01  n_main          PIC S9(5).
       01  k_main          PIC S9(5).
       01  counter_main    PIC S9(5).
       01  temp_main       PIC S9(5).
       01  div_main        PIC S9(5).
       01  rem_main        PIC S9(5).
       01  mult_main       PIC S9(5).
       01  res_main        PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).
       01 TEMP_4 PIC S9(9).
       01 TEMP_5 PIC S9(9).
       01 TEMP_6 PIC S9(9).
       01 TEMP_7 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
       ACCEPT n_main
       ACCEPT k_main
       MOVE 0 TO counter_main
       MOVE n_main TO temp_main
       PERFORM UNTIL NOT (temp_main > 0)
       ADD 1 TO counter_main
       DIVIDE temp_main BY 10 GIVING temp_main
       END-PERFORM
      * k = k % counter;
      * if (k < 0)
      * { k = k + counter; }
       DIVIDE k_main BY counter_main GIVING TEMP_0 REMAINDER TEMP_1
       COMPUTE TEMP_2 = TEMP_1 + counter_main
       DIVIDE TEMP_2 BY counter_main GIVING TEMP_3 REMAINDER TEMP_4
       COMPUTE k_main = TEMP_4
       COMPUTE div_main = k_main
       DIVIDE n_main BY div_main GIVING rem_main REMAINDER rem_main
       DIVIDE n_main BY div_main GIVING n_main
       COMPUTE TEMP_5 = counter_main - k_main
       COMPUTE mult_main = TEMP_5
       COMPUTE TEMP_6 = rem_main * mult_main
       COMPUTE TEMP_7 = TEMP_6 + n_main
       COMPUTE res_main = TEMP_7
       DISPLAY res_main
       EXIT.


