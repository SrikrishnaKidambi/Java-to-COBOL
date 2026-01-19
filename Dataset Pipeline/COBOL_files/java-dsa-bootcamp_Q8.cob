       IDENTIFICATION DIVISION.
       PROGRAM-ID. java-dsa-bootcamp_Q8.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_Q8_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_Q8_GLOBAL
       01  amount_main     PIC S9(5).
       01  deppercent_main PIC S9(5).
       01  year_main       PIC S9(5).
       01  temp_main       PIC S9(5).
       01  sc_main         PIC X(100).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_Q8_GLOBAL
       01  i_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
       DISPLAY "enter amount"
       ACCEPT amount_main
       DISPLAY "enter Depreciation percentage"
       ACCEPT deppercent_main
       DISPLAY "enter  number of years"
       ACCEPT year_main
       MOVE amount_main TO temp_main
       PERFORM VARYING i_main FROM 0 BY 1 UNTIL NOT (i_main < year_main)
       COMPUTE TEMP_0 = 100 - deppercent_main
       COMPUTE TEMP_1 = TEMP_0 * temp_main
       COMPUTE TEMP_2 = TEMP_1 / 100
       COMPUTE temp_main = TEMP_2
       END-PERFORM
       DISPLAY "after depreciation = "
       DISPLAY temp_main
       EXIT.


