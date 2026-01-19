       IDENTIFICATION DIVISION.
       PROGRAM-ID. java-dsa-bootcamp_Q7.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_Q7_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_Q7_GLOBAL
       01  in_main         PIC X(100).
       01  n_main          PIC S9(5).
       01  p_main          PIC S9(5).
       01  power_main      PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * power in java
      * Input from ODT is enabled
       DISPLAY "Enter a number: "
       ACCEPT n_main
       DISPLAY "Enter a power: "
       ACCEPT p_main
       MOVE 1 TO power_main
       DISPLAY n_main WITH NO ADVANCING
       DISPLAY " to the power of " WITH NO ADVANCING
       DISPLAY p_main WITH NO ADVANCING
       DISPLAY " is = " WITH NO ADVANCING
       PERFORM UNTIL NOT (p_main NOT = 0)
       MULTIPLY power_main BY n_main GIVING power_main
       SUBTRACT 1 FROM p_main
       END-PERFORM
       DISPLAY power_main
       EXIT.


