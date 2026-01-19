       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_FahrenheitToCelsius.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_FAHRENHEITTOCELSIUS_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_FAHRENHEITTOCELSIUS_GLOBAL
       01  scan_main       PIC X(100).
       01  s_main          PIC S9(5).
       01  e_main          PIC S9(5).
       01  w_main          PIC S9(5).
      * Variables for Scope:BLOCK_WHILE_BLOCK_METHOD_MAIN_CLASS_FAHRENHEITTOCELSIUS_GLOBAL
       01  c_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
       ACCEPT s_main
       ACCEPT e_main
       ACCEPT w_main
       PERFORM UNTIL NOT (s_main <= e_main)
       COMPUTE TEMP_0 = s_main - 32
       COMPUTE TEMP_1 = TEMP_0 * 5
       COMPUTE TEMP_2 = TEMP_1 / 9
       COMPUTE c_main = TEMP_2
       DISPLAY s_main
       DISPLAY "\t"
       DISPLAY c_main
       ADD s_main TO w_main GIVING s_main
       END-PERFORM
       EXIT.


