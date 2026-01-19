       IDENTIFICATION DIVISION.
       PROGRAM-ID. P8_StringCase.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_P8_STRINGCASE_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_P8_STRINGCASE_GLOBAL
       01  sc_main         PIC X(100).
       01  s_main          PIC X(100).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
       ACCEPT s_main
       COMPUTE TEMP_1 = CASE - s_main
       COMPUTE TEMP_0 = TEMP_1
       DISPLAY TEMP_0
       COMPUTE TEMP_3 = CASE - s_main
       COMPUTE TEMP_2 = TEMP_3
       DISPLAY TEMP_2
       EXIT.


