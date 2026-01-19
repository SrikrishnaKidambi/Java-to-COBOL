       IDENTIFICATION DIVISION.
       PROGRAM-ID. P20_RandomMod.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_P20_RANDOMMOD_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_P20_RANDOMMOD_GLOBAL
       01  r_main          PIC S9(5).
       01  mod_main        PIC S9(5).
       01 TEMP_0 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       COMPUTE TEMP_0 = RANDOM * 100
       COMPUTE r_main = TEMP_0
       DIVIDE r_main BY 10 GIVING mod_main REMAINDER mod_main
       DISPLAY r_main
       DISPLAY mod_main
       EXIT.


