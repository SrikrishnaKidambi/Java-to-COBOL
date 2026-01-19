       IDENTIFICATION DIVISION.
       PROGRAM-ID. java-dsa-bootcamp_FibonacciSeries.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_FIBONACCISERIES_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_FIBONACCISERIES_GLOBAL
       01  in_main         PIC X(100).
       01  n_main          PIC S9(5).
       01  i_main          PIC S9(5).
       01  j_main          PIC S9(5).
       01  c_main          PIC S9(5).
       01  k_main          PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
       ACCEPT n_main
       DISPLAY i_main WITH NO ADVANCING
       DISPLAY " " WITH NO ADVANCING
       DISPLAY j_main WITH NO ADVANCING
       PERFORM VARYING c_main FROM 2 BY 1 UNTIL NOT (c_main < n_main)
       ADD i_main TO j_main GIVING k_main
       DISPLAY " " WITH NO ADVANCING
       DISPLAY k_main WITH NO ADVANCING
       MOVE j_main TO i_main
       MOVE k_main TO j_main
       END-PERFORM
       EXIT.


