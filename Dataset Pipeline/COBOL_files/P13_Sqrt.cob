       IDENTIFICATION DIVISION.
       PROGRAM-ID. P13_Sqrt.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_P13_SQRT_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_P13_SQRT_GLOBAL
       01  sc_main         PIC X(100).
       01  x_main          PIC S9(5)V9(2).
       01  r_main          PIC S9(5)V9(2).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
       ACCEPT x_main
       COMPUTE r_main = x_main
       DISPLAY r_main
       EXIT.


