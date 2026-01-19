       IDENTIFICATION DIVISION.
       PROGRAM-ID. java-dsa-bootcamp_HCF.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_HCF_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_HCF_GLOBAL
       01  input_main      PIC X(100).
       01  num1_main       PIC S9(5).
       01  num2_main       PIC S9(5).
       01  max_main        PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_HCF_GLOBAL
       01  i_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
       DISPLAY "enter two numbers : " WITH NO ADVANCING
       ACCEPT num1_main
       ACCEPT num2_main
       COMPUTE max_main = num2_main
       PERFORM VARYING i_main FROM max_main BY -1 UNTIL NOT (i_main >= 1)
       DIVIDE num1_main BY i_main GIVING TEMP_0 REMAINDER TEMP_0
       DIVIDE num2_main BY i_main GIVING TEMP_1 REMAINDER TEMP_1
       IF TEMP_0 = 0  AND  TEMP_1 = 0
       DISPLAY "HCF is "
       DISPLAY i_main
       EXIT PERFORM
       END-IF
       END-PERFORM
       EXIT.


