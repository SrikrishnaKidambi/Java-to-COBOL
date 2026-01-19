       IDENTIFICATION DIVISION.
       PROGRAM-ID. java-dsa-bootcamp_Q6.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_Q6_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_Q6_GLOBAL
       01  in_main         PIC X(100).
       01  sales_main      PIC S9(5).
       01  comm_main       PIC S9(5).
       01  rates_main      PIC S9(5).
       01  RATESARRAY_MAIN_[SIZE=[RATES_MAIN]]-ARRAY.
           05  ratesArray_main PIC S9(5) OCCURS 100 TIMES.
       01  commission_main PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_Q6_GLOBAL
       01  i_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Calculate Commission Percentage
      * Input from ODT is enabled
       DISPLAY "Enter the number of sales: " WITH NO ADVANCING
       ACCEPT sales_main
       DISPLAY "Enter the commission percentage: " WITH NO ADVANCING
       ACCEPT comm_main
       DISPLAY "Enter the number of commission rates: " WITH NO ADVANCING
       ACCEPT rates_main
       DISPLAY "Enter the commission rates: " WITH NO ADVANCING
       PERFORM VARYING i_main FROM 0 BY 1 UNTIL NOT (i_main < rates_main)
       ACCEPT ratesArray_main(i_main + 1)
       END-PERFORM
      * Calculate commission
       MOVE 0 TO commission_main
       PERFORM VARYING i_main FROM 0 BY 1 UNTIL NOT (i_main < rates_main)
       IF sales_main >= ratesArray_main[i_main]
       COMPUTE TEMP_0 = sales_main * comm_main
       COMPUTE TEMP_1 = TEMP_0 / 100
       COMPUTE TEMP_2 = commission_main + TEMP_1
       COMPUTE commission_main = TEMP_2
       END-IF
       END-PERFORM
       DISPLAY "The commission is: "
       DISPLAY commission_main
       EXIT.


