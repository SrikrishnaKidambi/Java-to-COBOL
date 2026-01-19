       IDENTIFICATION DIVISION.
       PROGRAM-ID. P19_Trigonometry.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_P19_TRIGONOMETRY_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_P19_TRIGONOMETRY_GLOBAL
       01  sc_main         PIC X(100).
       01  angle_main      PIC S9(5)V9(2).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
       ACCEPT angle_main
       DISPLAY Math.sin(angle_main)
       DISPLAY Math.tan(angle_main)
       EXIT.


