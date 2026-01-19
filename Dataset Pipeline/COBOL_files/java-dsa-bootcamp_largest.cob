       IDENTIFICATION DIVISION.
       PROGRAM-ID. java-dsa-bootcamp_largest.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_LARGEST_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_LARGEST_GLOBAL
       01  in_main         PIC X(100).
       01  a_main          PIC S9(5).
       01  b_main          PIC S9(5).
       01  c_main          PIC S9(5).
       01  max_main        PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
       ACCEPT a_main
       ACCEPT b_main
       ACCEPT c_main
      * Q: Find the largest of the 3 numbers
      * int max = a;
      * if (b > max) {
      * max = b;
      * }
      * if (c > max) {
      * max = c;
      * }
      * int max = 0;
      * if (a > b) {
      * max = a;
      * } else {
      * max = b;
      * }
      * 
      * if (c > max) {
      * max = c;
      * }
       COMPUTE max_main = b_main
       DISPLAY max_main
       EXIT.


