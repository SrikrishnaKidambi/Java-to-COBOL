       IDENTIFICATION DIVISION.
       PROGRAM-ID. Program50_ProductSeries.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_PROGRAM50_PRODUCTSERIES_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_PROGRAM50_PRODUCTSERIES_GLOBAL
       01  i_main          PIC S9(5).
       01  prod_main       PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 1 TO i_main
       MOVE 1 TO prod_main
       PERFORM UNTIL NOT (i_main <= 10)
       MULTIPLY prod_main BY i_main GIVING prod_main
       ADD i_main TO 1 GIVING i_main
       END-PERFORM
       DISPLAY prod_main
       EXIT.


