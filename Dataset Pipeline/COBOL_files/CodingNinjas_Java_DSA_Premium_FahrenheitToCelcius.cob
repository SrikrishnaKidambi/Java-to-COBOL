       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_Premium_FahrenheitToCelcius.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_FAHRENHEITTOCELCIUS_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_FAHRENHEITTOCELCIUS_GLOBAL
       01  s_main          PIC X(100).
       01  start_main      PIC S9(5).
       01  end_main        PIC S9(5).
       01  step_main       PIC S9(5).
       01  fahrenheitValue_main PIC S9(5).
      * Variables for Scope:BLOCK_WHILE_BLOCK_METHOD_MAIN_CLASS_FAHRENHEITTOCELCIUS_GLOBAL
       01  celciusValue_main PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * TODO Auto-generated method stub
      * Input from ODT is enabled
       ACCEPT start_main
       ACCEPT end_main
       ACCEPT step_main
       MOVE start_main TO fahrenheitValue_main
       PERFORM UNTIL NOT (fahrenheitValue_main <= end_main)
       COMPUTE TEMP_0 = 0 / 9
       COMPUTE TEMP_1 = fahrenheitValue_main - 32
       COMPUTE TEMP_2 = TEMP_0 * TEMP_1
       COMPUTE celciusValue_main = TEMP_2
       DISPLAY fahrenheitValue_main
       DISPLAY "\t"
       DISPLAY celciusValue_main
       ADD fahrenheitValue_main TO step_main GIVING fahrenheitValue_main
       END-PERFORM
       EXIT.


