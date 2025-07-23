       IDENTIFICATION DIVISION.
       PROGRAM-ID. TestCase13.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:BLOCK_METHOD_CONVERTTOLOWERCASE_CLASS_TESTSCOPED_GLOBAL
       01  name_convertToLowercase PIC X(100).
      * Variables for Scope:METHOD_MAIN_CLASS_TESTSCOPED_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.



       MAIN-PARA.
       PERFORM CONVERTTOLOWERCASE-PARA

       convertToLowercase-PARA.
       MOVE "COBOL" TO name_convertToLowercase
       COMPUTE name_convertToLowercase = FUNCTION LOWER-CASE(name_convertToLowercase)
       DISPLAY "Lowercase version: "   name_convertToLowercase
       GOBACK
       EXIT.
       STOP RUN.

