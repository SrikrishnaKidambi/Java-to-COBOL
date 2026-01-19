       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_Premium_RectangularNumbers.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_PRINT_CLASS_RECTANGULARNUMBERS_GLOBAL
       01  n_print         PIC S9(5).
      * Variables for Scope:BLOCK_METHOD_PRINT_CLASS_RECTANGULARNUMBERS_GLOBAL
       01  i_print         PIC S9(5).
       01  j_print         PIC S9(5).
       01  a_print         PIC S9(5).
      * Variables for Scope:METHOD_MAIN_CLASS_RECTANGULARNUMBERS_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
       01 TEMP_0 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       print-PARA.
      * Write your code here
       PERFORM VARYING i_print FROM - BY 1 UNTIL NOT (i_print < n_print)
       MOVE n_print TO a_print
       PERFORM VARYING j_print FROM - BY 1 UNTIL NOT (j_print < n_print)
       COMPUTE TEMP_0 = i_print
       IF TEMP_0 < Math.abs(j_print)
       IF j_print < 0
       DISPLAY a_print WITH NO ADVANCING
       SUBTRACT 1 FROM a_print
       ELSE
       ADD 1 TO a_print
       DISPLAY a_print WITH NO ADVANCING
       END-IF
       ELSE
       DISPLAY a_print WITH NO ADVANCING
       END-IF
       END-PERFORM
       END-PERFORM
       EXIT.


       MAIN-PARA.
       MOVE 4 TO n_print
       PERFORM print-PARA
       EXIT.


