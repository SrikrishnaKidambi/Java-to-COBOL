       IDENTIFICATION DIVISION.
       PROGRAM-ID. Java-DSA-Bootcamp_ColNoFixed.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_COLNOFIXED_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_COLNOFIXED_GLOBAL
       01  ARR_MAIN_-ARRAY.
           05  arr_main     PIC S9(5) OCCURS 100 TIMES.
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_COLNOFIXED_GLOBAL
       01  row_main        PIC S9(5).
      * Variables for Scope:FOR_BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_COLNOFIXED_GLOBAL
       01  col_main        PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       PERFORM VARYING row_main FROM 0 BY 1 UNTIL NOT (row_main < arr_main.length)
       PERFORM VARYING col_main FROM 0 BY 1 UNTIL NOT (col_main < arr_main[row_main].length)
       COMPUTE TEMP_1 = row_main + 1
       COMPUTE TEMP_0 = col_main
       DISPLAY TEMP_0 WITH NO ADVANCING
       DISPLAY " " WITH NO ADVANCING
       END-PERFORM
       END-PERFORM
       EXIT.


