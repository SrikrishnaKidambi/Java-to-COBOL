       IDENTIFICATION DIVISION.
       PROGRAM-ID. java-dsa-bootcamp_LCM.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_LCM_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_LCM_GLOBAL
       01  input_main      PIC X(100).
       01  num1_main       PIC S9(5).
       01  num2_main       PIC S9(5).
       01  max_main        PIC S9(5).
       01  flag_main       PIC S9(5).
      * Variables for Scope:FOR_BLOCK_IF_BLOCK_METHOD_MAIN_CLASS_LCM_GLOBAL
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
       DISPLAY "enter two numbers : " WITH NO ADVANCING
       ACCEPT num1_main
       ACCEPT num2_main
       COMPUTE max_main = num2_main
       MOVE 0 TO flag_main
       IF num1_main = 1  OR  num2_main = 1
       DISPLAY "LCM is "
       DISPLAY 1
       ELSE
       PERFORM VARYING i_main FROM 2 BY 1 UNTIL NOT (i_main <= max_main)
       DIVIDE num1_main BY i_main GIVING TEMP_0 REMAINDER TEMP_0
       DIVIDE num2_main BY i_main GIVING TEMP_1 REMAINDER TEMP_1
       IF TEMP_0 = 0  AND  TEMP_1 = 0
       DISPLAY "LCM is "
       DISPLAY i_main
       MOVE 1 TO flag_main
       EXIT PERFORM
       END-IF
       END-PERFORM
       IF flag_main = 0
       DISPLAY "LCM is "
       MULTIPLY num1_main BY num2_main GIVING TEMP_2
       DISPLAY TEMP_2
       END-IF
       END-IF
       EXIT.


