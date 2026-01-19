       IDENTIFICATION DIVISION.
       PROGRAM-ID. java-dsa-bootcamp_Q9.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_Q9_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_Q9_GLOBAL
       01  input_main      PIC X(100).
       01  runs_main       PIC S9(5).
       01  matches_main    PIC S9(5).
       01  notout_main     PIC S9(5).
       01  outmatches_main PIC S9(5).
       01  baverage_main   PIC S9(5)V9(2).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Calculate Batting Average
      * Input from ODT is enabled
       DISPLAY "Enter the number of Runs: "
       ACCEPT runs_main
       DISPLAY "Enter number of matches"
       ACCEPT matches_main
       DISPLAY "Enter number of not-out matches"
       ACCEPT notout_main
       SUBTRACT notout_main FROM matches_main GIVING outmatches_main
       DIVIDE runs_main BY outmatches_main GIVING baverage_main
       DISPLAY "Batting Average= "
       DISPLAY baverage_main
       EXIT.


