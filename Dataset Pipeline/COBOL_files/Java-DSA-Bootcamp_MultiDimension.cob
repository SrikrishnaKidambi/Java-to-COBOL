       IDENTIFICATION DIVISION.
       PROGRAM-ID. Java-DSA-Bootcamp_MultiDimension.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_MULTIDIMENSION_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_MULTIDIMENSION_GLOBAL
       01  in_main         PIC X(100).
       01  arr_main-ARRAY .
           05  arr_main     PIC S9(5) OCCURS 33 TIMES.
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_MULTIDIMENSION_GLOBAL
       01  row_main        PIC S9(5).
      * Variables for Scope:FOR_BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_MULTIDIMENSION_GLOBAL
       01  col_main        PIC S9(5).
      * Variables for Scope:ENHANCEDFOR_FOR_BLOCK_METHOD_MAIN_CLASS_MULTIDIMENSION_GLOBAL
       01  A_MAIN_-ARRAY  .
           05  a_main       PIC S9(5) OCCURS 100 TIMES.


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * 1 2 3
             4 5 6
             7 8 9
      * Input from ODT is enabled
      * int[][] arr = new int[3][];
      * int[][] arr = {
      * {1, 2, 3}, // 0th index
      * {4, 5}, // 1st index
      * {6, 7, 8, 9} // 2nd index -> arr[2] = {6, 7, 8, 9}
      * };
      * no of rows
       DISPLAY arr_main.length
      * input
       PERFORM VARYING row_main FROM 0 BY 1 UNTIL NOT (row_main < arr_main.length)
      * for each col in every row
       PERFORM VARYING col_main FROM 0 BY 1 UNTIL NOT (col_main < arr_main[row_main].length)
       ACCEPT arr_main(row_main + 1)[col_main]
       END-PERFORM
       END-PERFORM
      * output
      * for (int row = 0; row < arr.length; row++) {
      * // for each col in every row
      * for (int col = 0; col < arr[row].length; col++) {
      * System.out.print(arr[row][col] + " ");
      * }
      * System.out.println();
      * }
      * output
      * for (int row = 0; row < arr.length; row++) {
      * System.out.println(Arrays.toString(arr[row]));
      * }
       DISPLAY Arrays.toString(a_main)
       EXIT.


