       IDENTIFICATION DIVISION.
       PROGRAM-ID. TestCase13.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:BLOCK_METHOD_CONVERTTOLOWERCASE_CLASS_TEST_GLOBAL
       01  name_convertToLowercase PIC X(100).
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.


       PROCEDURE DIVISION.


       convertToLowercase-PARA.
       MOVE "COBOL" TO name_convertToLowercase 
       DISPLAY "Lowercase version: "   
       FUNCTION LOWER-CASE(name_convertToLowercase)
       GOBACK
       EXIT.

       MAIN-PARA.
       PERFORM CONVERTTOLOWERCASE-PARA
       EXIT.
       STOP RUN.

