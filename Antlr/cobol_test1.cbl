       IDENTIFICATION DIVISION.
       PROGRAM-ID. cobol_test1.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_SAYHELLO_CLASS_TEST_GLOBAL
       01  x_sayHello      PIC 9(5).
      * Variables for Scope:BLOCK_METHOD_SAYHELLO_CLASS_TEST_GLOBAL
       01  msg_sayHello    PIC X(10).
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_-ARRAY    .
           05  args         PIC X(10) OCCURS 100 TIMES.
