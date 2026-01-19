       IDENTIFICATION DIVISION.
       PROGRAM-ID. java-dsa-bootcamp_Greet.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_GREET_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_GREET_GLOBAL
       01  in_main         PIC X(100).
       01  name_main       PIC X(100).
      * Variables for Scope:METHOD_GREETINGS_CLASS_GREET_GLOBAL
       01  greet_greetings PIC X(100).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       greetings-PARA.
       DISPLAY "Hello "
       DISPLAY greet_greetings_greetings
       DISPLAY " Welcome to Programmers World!"
       EXIT.


       MAIN-PARA.
      * Input from ODT is enabled
      * String name=in.next();
        System.out.println("Hello "+name+" Welcome to Programmers World!");
      * Using Method();
       ACCEPT name_main
       PERFORM greetings-PARA
       EXIT.


