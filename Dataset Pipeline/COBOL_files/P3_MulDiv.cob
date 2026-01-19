       IDENTIFICATION DIVISION.
       PROGRAM-ID. P3_MulDiv.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_P3_MULDIV_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_P3_MULDIV_GLOBAL
       01  sc_main         PIC X(100).
       01  a_main          PIC S9(5).
       01  b_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
       ACCEPT a_main
       ACCEPT b_main
       MULTIPLY a_main BY b_main GIVING TEMP_0
       DISPLAY TEMP_0
       DIVIDE a_main BY b_main GIVING TEMP_1
       DISPLAY TEMP_1
       EXIT.


