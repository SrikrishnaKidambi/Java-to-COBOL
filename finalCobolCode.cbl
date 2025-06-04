       IDENTIFICATION DIVISION.
       PROGRAM-ID. NestedSwitchExample.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_-ARRAY    .
           05  args         PIC X(10) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  category        PIC S9(5).
       01  option          PIC S9(5).


       PROCEDURE DIVISION.


       MAIN-PARA.
       MOVE 2 TO category.
       MOVE 1 TO option.
       EVALUATE category
       WHEN 1
       DISPLAY "Category: Fruits"
       EVALUATE option
       WHEN 1
       DISPLAY "Option: Apple"
       WHEN 2
       DISPLAY "Option: Banana"
       WHEN OTHER
       DISPLAY "Unknown fruit option"
       END-EVALUATE
       WHEN 2
       DISPLAY "Category: Vehicles"
       EVALUATE option
       WHEN 1
       DISPLAY "Option: Car"
       WHEN 2
       DISPLAY "Option: Bike"
       WHEN OTHER
       DISPLAY "Unknown vehicle option"
       END-EVALUATE
       WHEN OTHER
       DISPLAY "Invalid category"
       END-EVALUATE.
       EXIT.
       STOP RUN.

