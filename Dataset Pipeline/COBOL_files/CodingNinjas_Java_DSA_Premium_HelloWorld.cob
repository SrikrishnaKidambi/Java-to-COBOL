       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_Premium_HelloWorld.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_HELLOWORLD_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * TODO Auto-generated method stub
       DISPLAY "Hello World" WITH NO ADVANCING
      * here /n is used to display in the new line
       DISPLAY "\n"
       DISPLAY "This is Kumar Sumit"
      * you can also display on new line by System.out.println.
       DISPLAY "this is neha kumari"
       EXIT.


