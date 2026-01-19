       IDENTIFICATION DIVISION.
       PROGRAM-ID. P17_Split.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_P17_SPLIT_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_P17_SPLIT_GLOBAL
       01  sc_main         PIC X(100).
       01  s_main          PIC X(100).
       01  PARTS_MAIN_-ARRAY.
           05  parts_main   PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_P17_SPLIT_GLOBAL
       01  i_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
       ACCEPT s_main
       UNSTRING s_main DELIMITED BY " " INTO parts_main(1), parts_main(2), parts_main(3), parts_main(4), parts_main(5)
       PERFORM VARYING i_main FROM 0 BY 1 UNTIL NOT (i_main < parts_main.length)
       MOVE parts_main(i_main + 1) TO TEMP_0
       DISPLAY TEMP_0
       END-PERFORM
       EXIT.


