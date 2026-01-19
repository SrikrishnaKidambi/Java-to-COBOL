       IDENTIFICATION DIVISION.
       PROGRAM-ID. P5_SwitchDemo.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_P5_SWITCHDEMO_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_P5_SWITCHDEMO_GLOBAL
       01  sc_main         PIC X(100).
       01  n_main          PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
       ACCEPT n_main
       EVALUATE n_main
       WHEN 1
       DISPLAY "ONE"
       WHEN 2
       DISPLAY "TWO"
       WHEN OTHER
       DISPLAY "OTHER"
       END-EVALUATE
       EXIT.


