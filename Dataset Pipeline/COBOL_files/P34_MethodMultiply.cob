       IDENTIFICATION DIVISION.
       PROGRAM-ID. P34_MethodMultiply.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MULTIPLY_CLASS_P34_METHODMULTIPLY_GLOBAL
       01  a_multiply      PIC S9(5).
       01  b_multiply      PIC S9(5).
      * Variables for Scope:METHOD_MAIN_CLASS_P34_METHODMULTIPLY_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
       01 TEMP_0 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       multiply-PARA.
       MULTIPLY a_multiply BY b_multiply GIVING TEMP_0
       DISPLAY TEMP_0
       EXIT.


       MAIN-PARA.
       MOVE 6 TO a_multiply
       MOVE 7 TO b_multiply
       PERFORM multiply-PARA
       EXIT.


