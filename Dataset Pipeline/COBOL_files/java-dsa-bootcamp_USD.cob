       IDENTIFICATION DIVISION.
       PROGRAM-ID. java-dsa-bootcamp_USD.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_USD_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_USD_GLOBAL
       01  in_main         PIC X(100).
       01  n_main          PIC S9(5).
       01  usd_main        PIC S9(5)V9(2).
       01 TEMP_0 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
       ACCEPT n_main
      * currently 1inr is equal to 0.012usd.
       COMPUTE TEMP_0 = 0 * 012
       COMPUTE usd_main = TEMP_0
       DISPLAY "$" WITH NO ADVANCING
       DISPLAY usd_main WITH NO ADVANCING
       EXIT.


