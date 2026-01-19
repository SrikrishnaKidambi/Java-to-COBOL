       IDENTIFICATION DIVISION.
       PROGRAM-ID. Java-DSA-Bootcamp_Temperature.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TEMPERATURE_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TEMPERATURE_GLOBAL
       01  in_main         PIC X(100).
       01  tempC_main      PIC S9(5)V9(2).
       01  tempF_main      PIC S9(5)V9(2).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
       DISPLAY "Please enter temp in C: " WITH NO ADVANCING
       ACCEPT tempC_main
       COMPUTE TEMP_0 = tempC_main * 9
       COMPUTE TEMP_1 = TEMP_0 / 5
       COMPUTE TEMP_2 = TEMP_1 + 32
       COMPUTE tempF_main = TEMP_2
       DISPLAY tempF_main
       EXIT.


