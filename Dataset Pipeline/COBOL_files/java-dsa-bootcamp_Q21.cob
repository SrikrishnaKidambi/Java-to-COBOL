       IDENTIFICATION DIVISION.
       PROGRAM-ID. java-dsa-bootcamp_Q21.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_Q21_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_Q21_GLOBAL
       01  input_main      PIC X(100).
       01  n_main          PIC S9(5).
       01  a_main          PIC S9(5).
       01  b_main          PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_Q21_GLOBAL
       01  i_main          PIC S9(5).
      * Variables for Scope:BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_Q21_GLOBAL
       01  temp_main       PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * fibbonaci series
      * Input from ODT is enabled
       DISPLAY "Enter the number of terms in the fibbonaci series :" WITH NO ADVANCING
       ACCEPT n_main
       MOVE 0 TO a_main
       MOVE 1 TO b_main
       DISPLAY a_main WITH NO ADVANCING
       DISPLAY " " WITH NO ADVANCING
       DISPLAY b_main WITH NO ADVANCING
       PERFORM VARYING i_main FROM 0 BY 1 UNTIL NOT (i_main < n_main)
       ADD a_main TO b_main GIVING temp_main
       DISPLAY " " WITH NO ADVANCING
       DISPLAY temp_main WITH NO ADVANCING
       MOVE b_main TO a_main
       MOVE temp_main TO b_main
       END-PERFORM
       EXIT.


