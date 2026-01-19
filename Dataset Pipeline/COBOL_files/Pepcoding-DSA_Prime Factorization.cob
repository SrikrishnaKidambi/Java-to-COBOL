       IDENTIFICATION DIVISION.
       PROGRAM-ID. Pepcoding-DSA_Prime Factorization.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  scn_main        PIC X(100).
       01  n_main          PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  factor_main     PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
       ACCEPT n_main
      * Approach 1
      * for(int factor = 2; factor <= n; factor++)
      * {
      * while(n % factor == 0)
      * {
      * System.out.print(factor + " ");
      * n = n / factor;
      * }
      * }
      * Approach 2: Optimization
       COMPUTE TEMP_0 = factor_main * factor_main
       PERFORM VARYING factor_main FROM 2 BY 1 UNTIL NOT (TEMP_0 <= n_main)
       COMPUTE TEMP_1 = n_main % factor_main
       PERFORM UNTIL NOT (TEMP_1 = 0)
       DISPLAY factor_main WITH NO ADVANCING
       DISPLAY " " WITH NO ADVANCING
       DIVIDE n_main BY factor_main GIVING n_main
       COMPUTE TEMP_1 = n_main % factor_main
       END-PERFORM
       COMPUTE TEMP_0 = factor_main * factor_main
       END-PERFORM
      * Prime Factor greater than root n, there can be only one such prime factor
       IF n_main != 1
       DISPLAY n_main WITH NO ADVANCING
       END-IF
       EXIT.


