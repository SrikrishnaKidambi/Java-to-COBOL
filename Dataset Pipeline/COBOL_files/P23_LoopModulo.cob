       IDENTIFICATION DIVISION.
       PROGRAM-ID. P23_LoopModulo.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_P23_LOOPMODULO_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_P23_LOOPMODULO_GLOBAL
       01  i_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       PERFORM VARYING i_main FROM 1 BY 1 UNTIL NOT (i_main <= 10)
       DIVIDE i_main BY 3 GIVING TEMP_0 REMAINDER TEMP_0
       DISPLAY TEMP_0
       END-PERFORM
       EXIT.


