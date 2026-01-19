       IDENTIFICATION DIVISION.
       PROGRAM-ID. Java-DSA-Bootcamp_Input.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_INPUT_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_INPUT_GLOBAL
       01  in_main         PIC X(100).
       01  arr_main-ARRAY .
           05  arr_main     PIC S9(5) OCCURS 5 TIMES.
       01  str_main-ARRAY .
           05  str_main     PIC X(100) OCCURS 4 TIMES.
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_INPUT_GLOBAL
       01  i_main          PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
      * array of primitives
       COMPUTE arr_main(1) = 23
       COMPUTE arr_main(2) = 45
       COMPUTE arr_main(3) = 233
       COMPUTE arr_main(4) = 543
       COMPUTE arr_main(5) = 3
      * [23, 45, 233, 543, 3]
       DISPLAY arr_main(4)
      * input using for loops
       PERFORM VARYING i_main FROM 0 BY 1 UNTIL NOT (i_main < arr_main.length)
       ACCEPT arr_main(i_main + 1)
       END-PERFORM
      * 
      * System.out.println(Arrays.toString(arr));
      * for (int i = 0; i < arr.length; i++) {
      * System.out.print(arr[i] + " ");
      * }
      * for(int num : arr) { // for every element in array, print the element
      * System.out.print(num + " "); //  here num represents element of the array
      * }
      * System.out.println(arr[5]); // index out of bound error
      * array of objects
       PERFORM VARYING i_main FROM 0 BY 1 UNTIL NOT (i_main < str_main.length)
       ACCEPT str_main(i_main + 1)
       END-PERFORM
       DISPLAY Arrays.toString(str_main)
      * modify
       STRING        "kunal" DELIMITED BY SIZE INTO str_main(2)
       DISPLAY Arrays.toString(str_main)
       EXIT.


