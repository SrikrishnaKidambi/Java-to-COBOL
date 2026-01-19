       IDENTIFICATION DIVISION.
       PROGRAM-ID. P30_ModMethod.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_SHOWMOD_CLASS_P30_MODMETHOD_GLOBAL
       01  a_showMod       PIC S9(5).
       01  b_showMod       PIC S9(5).
      * Variables for Scope:METHOD_MAIN_CLASS_P30_MODMETHOD_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
       01 TEMP_0 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       showMod-PARA.
       DIVIDE a_showMod BY b_showMod GIVING TEMP_0 REMAINDER TEMP_0
       DISPLAY TEMP_0
       EXIT.


       MAIN-PARA.
       MOVE 20 TO a_showMod
       MOVE 6 TO b_showMod
       PERFORM showMod-PARA
       EXIT.


