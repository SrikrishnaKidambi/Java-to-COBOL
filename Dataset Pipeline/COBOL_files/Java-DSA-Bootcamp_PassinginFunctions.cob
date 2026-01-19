       IDENTIFICATION DIVISION.
       PROGRAM-ID. Java-DSA-Bootcamp_PassinginFunctions.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_PASSINGINFUNCTIONS_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_PASSINGINFUNCTIONS_GLOBAL
       01  NUMS_MAIN_-ARRAY.
           05  nums_main    PIC S9(5) OCCURS 100 TIMES.
      * Variables for Scope:METHOD_CHANGE_CLASS_PASSINGINFUNCTIONS_GLOBAL
       01  ARR_CHANGE_-ARRAY.
           05  arr_change   PIC S9(5) OCCURS 100 TIMES.


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       change-PARA.
       COMPUTE arr_change(1) = 99
       EXIT.


       MAIN-PARA.
       DISPLAY Arrays.toString(nums_main)
       PERFORM change-PARA
       DISPLAY Arrays.toString(nums_main)
       EXIT.


