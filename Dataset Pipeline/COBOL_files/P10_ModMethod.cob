       IDENTIFICATION DIVISION.
       PROGRAM-ID. P10_ModMethod.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_COMPUTEMOD_CLASS_P10_MODMETHOD_GLOBAL
       01  a_computeMod    PIC S9(5).
       01  b_computeMod    PIC S9(5).
      * Variables for Scope:BLOCK_METHOD_COMPUTEMOD_CLASS_P10_MODMETHOD_GLOBAL
       01  r_computeMod    PIC S9(5).
      * Variables for Scope:METHOD_MAIN_CLASS_P10_MODMETHOD_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       computeMod-PARA.
       DIVIDE a_computeMod BY b_computeMod GIVING r_computeMod REMAINDER r_computeMod
       DISPLAY r_computeMod
       EXIT.


       MAIN-PARA.
       MOVE 17 TO a_computeMod
       MOVE 5 TO b_computeMod
       PERFORM computeMod-PARA
       EXIT.


