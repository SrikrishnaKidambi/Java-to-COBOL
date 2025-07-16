       IDENTIFICATION DIVISION.
       PROGRAM-ID. TestCase19.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:BLOCK_METHOD_DISPLAYACOS_CLASS_TEST_GLOBAL
       01  x_displayAcos   PIC S9(5)V9(2).
      * Variables for Scope:BLOCK_IF_BLOCK_METHOD_DISPLAYACOS_CLASS_TEST_GLOBAL
       01  val_displayAcos PIC S9(5)V9(2).
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
