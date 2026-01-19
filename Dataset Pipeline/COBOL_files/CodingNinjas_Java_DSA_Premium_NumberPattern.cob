       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_Premium_NumberPattern.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_NUMBERPATTERN_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_NUMBERPATTERN_GLOBAL
       01  s_main          PIC X(100).
       01  n_main          PIC S9(5).
       01  rows_main       PIC S9(5).
      * Variables for Scope:FOR_BLOCK_WHILE_BLOCK_METHOD_MAIN_CLASS_NUMBERPATTERN_GLOBAL
       01  cols_main       PIC S9(5).
       01  i_main          PIC S9(5).
      * Variables for Scope:BLOCK_WHILE_BLOCK_METHOD_MAIN_CLASS_NUMBERPATTERN_GLOBAL
       01  starsCount_main PIC S9(5).
       01  printValue_main PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * TODO Auto-generated method stub
      * Input from ODT is enabled
       ACCEPT n_main
       MOVE n_main TO rows_main
       PERFORM UNTIL NOT (rows_main >= 1)
      * code to print increasing numbers
       PERFORM VARYING cols_main FROM 1 BY 1 UNTIL NOT (cols_main <= rows_main)
       DISPLAY cols_main WITH NO ADVANCING
       END-PERFORM
      * code to print stars
       COMPUTE TEMP_0 = n_main - rows_main
       COMPUTE TEMP_1 = TEMP_0 * 2
       COMPUTE starsCount_main = TEMP_1
       PERFORM VARYING i_main FROM 1 BY 1 UNTIL NOT (i_main <= starsCount_main)
       DISPLAY "*" WITH NO ADVANCING
       END-PERFORM
      * code to print decreasing numbers
       MOVE rows_main TO printValue_main
       PERFORM VARYING i_main FROM 1 BY 1 UNTIL NOT (i_main <= rows_main)
       DISPLAY printValue_main WITH NO ADVANCING
       SUBTRACT 1 FROM printValue_main
       END-PERFORM
       SUBTRACT 1 FROM rows_main
       END-PERFORM
       EXIT.


