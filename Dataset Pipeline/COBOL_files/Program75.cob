       IDENTIFICATION DIVISION.
       PROGRAM-ID. Program75.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_PROGRAM75_PRODUCTOFRANGE_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_PROGRAM75_PRODUCTOFRANGE_GLOBAL
       01  prod_main       PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_PROGRAM75_PRODUCTOFRANGE_GLOBAL
       01  i_main          PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 1 TO prod_main
       PERFORM VARYING i_main FROM 2 BY 1 UNTIL NOT (i_main <= 5)
       MULTIPLY prod_main BY i_main GIVING prod_main
       END-PERFORM
       DISPLAY prod_main
       EXIT.


