       IDENTIFICATION DIVISION.
       PROGRAM-ID. P2_AbsDiff.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_P2_ABSDIFF_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_P2_ABSDIFF_GLOBAL
       01  sc_main         PIC X(100).
       01  x_main          PIC S9(5).
       01  y_main          PIC S9(5).
       01  diff_main       PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
       ACCEPT x_main
       ACCEPT y_main
       SUBTRACT y_main FROM x_main GIVING diff_main
       IF diff_main < 0
       COMPUTE diff_main = diff_main
       END-IF
       DISPLAY diff_main
       EXIT.


