       IDENTIFICATION DIVISION.
       PROGRAM-ID. java-dsa-bootcamp_Q2.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_Q2_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_Q2_GLOBAL
       01  in_main         PIC X(100).
       01  kwh_main        PIC S9(5)V9(2).
       01  cost_main       PIC S9(5)V9(2).
       01  bill_main       PIC S9(5)V9(2).
       01  days_main       PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * electricity bill program
      * Input from ODT is enabled
       DISPLAY "Enter the amount of kwh used: "
       ACCEPT kwh_main
       DISPLAY "Enter the cost of the kwh: "
       ACCEPT cost_main
       DISPLAY "Enter the number of days used: "
       ACCEPT days_main
       MOVE 0 TO bill_main
       IF kwh_main > 0  AND  cost_main > 0  AND  days_main > 0
       MULTIPLY kwh_main BY cost_main GIVING bill_main
       DIVIDE bill_main BY days_main GIVING bill_main
       DISPLAY "The bill is: "
       DISPLAY bill_main
       ELSE
       DISPLAY "Invalid input"
       END-IF
       EXIT.


