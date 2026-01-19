       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_Print2DArray.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_PRINT2DARRAY_CLASS_PRINT2DARRAY_GLOBAL
       01  INPUT_PRINT2DARRAY_-ARRAY.
           05  input_print2DArray PIC S9(5) OCCURS 100 TIMES.
      * Variables for Scope:FOR_BLOCK_METHOD_PRINT2DARRAY_CLASS_PRINT2DARRAY_GLOBAL
       01  i_print2DArray  PIC S9(5).
      * Variables for Scope:BLOCK_FOR_BLOCK_METHOD_PRINT2DARRAY_CLASS_PRINT2DARRAY_GLOBAL
       01  count_print2DArray PIC S9(5).
      * Variables for Scope:FOR_BLOCK_WHILE_BLOCK_FOR_BLOCK_METHOD_PRINT2DARRAY_CLASS_PRINT2DARRAY_GLOBAL
       01  j_print2DArray  PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       print2DArray-PARA.
      * Write your code here
       PERFORM VARYING i_print2DArray FROM 0 BY 1 UNTIL NOT (i_print2DArray < input_print2DArray.length)
       COMPUTE TEMP_0 = length - i_print2DArray
       COMPUTE count_print2DArray = TEMP_0
       PERFORM UNTIL NOT (count_print2DArray > 0)
       PERFORM VARYING j_print2DArray FROM 0 BY 1 UNTIL NOT (j_print2DArray < input_print2DArray[0].length)
       COMPUTE TEMP_2 = i_print2DArray + 1
       COMPUTE TEMP_1 = j_print2DArray
       DISPLAY TEMP_1 WITH NO ADVANCING
       DISPLAY " " WITH NO ADVANCING
       END-PERFORM
       SUBTRACT 1 FROM count_print2DArray
       DISPLAY ""
       END-PERFORM
       END-PERFORM
       EXIT.


