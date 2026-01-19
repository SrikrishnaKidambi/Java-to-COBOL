       IDENTIFICATION DIVISION.
       PROGRAM-ID. Java-DSA-Bootcamp_Basics.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_BASICS_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_BASICS_GLOBAL
       01  count_main      PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * int a = 10;
      * if (a == 10) {
      * System.out.println("Hello World");
      * }
      * int count = 1;
      * while(count != 5) {
      * System.out.println(count);
      * count++;
      * }
      * for loop
       PERFORM VARYING count_main FROM 1 BY 1 UNTIL NOT (count_main NOT = 5)
       DISPLAY count_main
       END-PERFORM
       EXIT.


