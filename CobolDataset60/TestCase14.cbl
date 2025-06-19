       IDENTIFICATION DIVISION.
       PROGRAM-ID. TestCase14.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:BLOCK_METHOD_CONVERTTOUPPERCASE_CLASS_TEST_GLOBAL
       01  lang_convertToUppercase PIC X(100).
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.


       PROCEDURE DIVISION.


       convertToUppercase-PARA.
       MOVE "java" TO lang_convertToUppercase
       MOVE FUNCTION UPPER-CASE(lang_convertToUppercase) TO
        lang_convertToUppercase       
       EVALUATE lang_convertToUppercase
       WHEN "JAVA"
       DISPLAY "Language is JAVA"
       WHEN OTHER
       DISPLAY "Unknown language"
       END-EVALUATE
       GOBACK
       EXIT.

       MAIN-PARA.
       PERFORM CONVERTTOUPPERCASE-PARA
       EXIT.
       STOP RUN.

