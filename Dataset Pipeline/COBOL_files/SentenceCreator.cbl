       IDENTIFICATION DIVISION.
       PROGRAM-ID. SentenceCreator.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_-ARRAY    .
           05  args         PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  sc              PIC X(100).
       01  color1           PIC X(100).
       01  animal          PIC X(100).
       01  sentence1        PIC X(100).


       PROCEDURE DIVISION.


       MAIN-PARA.
      * Input from ODT is enabled
       DISPLAY "Enter your favorite color: " WITH NO ADVANCING
       ACCEPT color1
       DISPLAY "Enter your favorite animal: " WITH NO ADVANCING
       ACCEPT animal
       STRING        "You like a " DELIMITED BY SIZE 
       color1 DELIMITED BY SPACE 
       " " DELIMITED BY SIZE 
       animal DELIMITED BY SPACE 
       "." DELIMITED BY SIZE INTO sentence1
       DISPLAY sentence1
       EXIT.
       STOP RUN.

