       IDENTIFICATION DIVISION.
       PROGRAM-ID. Test36.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
<<<<<<< HEAD
      * Variables for Scope:METHOD_SUMARRAY_CLASS_TESTSCOPED_GLOBAL
       01  ARR_SUMARRAY_-ARRAY.
           05  arr_sumArray PIC S9(5) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_SUMARRAY_CLASS_TESTSCOPED_GLOBAL
       01  sum_sumArray    PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_SUMARRAY_CLASS_TESTSCOPED_GLOBAL
       01  i_sumArray      PIC S9(5).
=======
>>>>>>> c3913f956c2a9abd6af3157c753d01639fcdf513
      * Variables for Scope:METHOD_MAIN_CLASS_TESTSCOPED_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TESTSCOPED_GLOBAL
       01  arr_main-ARRAY .
           05  arr_main     PIC S9(5) OCCURS 10 TIMES.
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_TESTSCOPED_GLOBAL
       01  i_main          PIC S9(5).


       PROCEDURE DIVISION.


       MAIN-PARA.
       PERFORM VARYING i_main FROM 0 BY 1 UNTIL NOT (i_main < 10)
       COMPUTE arr_main(i_main + 1) = 0
       END-PERFORM.
       MOVE arr_main TO arr_sumArray
       PERFORM SUMARRAY-PARA

       sumArray-PARA.
       MOVE 0 TO sum_sumArray
       PERFORM VARYING i_sumArray FROM 0 BY 1 UNTIL NOT (i_sumArray < arr_sumArray.length)
       COMPUTE sum_sumArray = sum_sumArray + arr_sumArray(i_sumArray + 1)
       END-PERFORM.
       EXIT.
       STOP RUN.

