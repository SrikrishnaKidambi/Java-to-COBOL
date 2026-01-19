       IDENTIFICATION DIVISION.
       PROGRAM-ID. P15_AddMethod.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_ADD_CLASS_P15_ADDMETHOD_GLOBAL
       01  x_add           PIC S9(5).
       01  y_add           PIC S9(5).
      * Variables for Scope:BLOCK_METHOD_ADD_CLASS_P15_ADDMETHOD_GLOBAL
       01  s_add           PIC S9(5).
      * Variables for Scope:METHOD_MAIN_CLASS_P15_ADDMETHOD_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       add-PARA.
       ADD x_add TO y_add GIVING s_add
       DISPLAY s_add
       EXIT.


       MAIN-PARA.
       MOVE 10 TO x_add
       MOVE 20 TO y_add
       PERFORM add-PARA
       EXIT.


