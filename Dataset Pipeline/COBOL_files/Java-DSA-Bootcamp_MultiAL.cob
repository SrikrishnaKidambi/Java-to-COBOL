       IDENTIFICATION DIVISION.
       PROGRAM-ID. Java-DSA-Bootcamp_MultiAL.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_MULTIAL_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_MULTIAL_GLOBAL
       01  in_main         PIC X(100).
       01  list_main       PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_MULTIAL_GLOBAL
       01  i_main          PIC S9(5).
      * Variables for Scope:FOR_BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_MULTIAL_GLOBAL
       01  j_main          PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
      * initialisation
       PERFORM VARYING i_main FROM 0 BY 1 UNTIL NOT (i_main < 3)
       END-PERFORM
      * add elements
       PERFORM VARYING i_main FROM 0 BY 1 UNTIL NOT (i_main < 3)
       PERFORM VARYING j_main FROM 0 BY 1 UNTIL NOT (j_main < 3)
       END-PERFORM
       END-PERFORM
       DISPLAY list_main
       EXIT.


