       IDENTIFICATION DIVISION.
       PROGRAM-ID. dsa-essentials-java_subset.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_SUBSET_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_SUBSET_GLOBAL
       01  scanner_main    PIC X(100).
       01  n_main          PIC S9(5).
       01  ARR_MAIN_[SIZE=[N_MAIN]]-ARRAY.
           05  arr_main     PIC S9(5) OCCURS 100 TIMES.
       01  start_time_main PIC S9(5).
       01  end_time_main   PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_SUBSET_GLOBAL
       01  i_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * your code goes here
      * Input from ODT is enabled
       ACCEPT n_main
       PERFORM VARYING i_main FROM 0 BY 1 UNTIL NOT (i_main < n_main)
       SUBTRACT i_main FROM n_main GIVING 1)
       END-PERFORM
       SUBTRACT start_time_main FROM end_time_main GIVING TEMP_0
       DISPLAY TEMP_0 WITH NO ADVANCING
       EXIT.


