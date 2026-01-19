       IDENTIFICATION DIVISION.
       PROGRAM-ID. SplitCSV.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_-ARRAY    .
           05  args         PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  sc              PIC X(100).
       01  input1           PIC X(100).
       01  ITEMS_-ARRAY   .
           05  items        PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  i               PIC S9(5).


       PROCEDURE DIVISION.


       MAIN-PARA.
      * Input from ODT is enabled
       DISPLAY "Enter comma-separated values 5 vals: " WITH NO ADVANCING
       ACCEPT input1
      * works only if items array length is 5
       UNSTRING input1 DELIMITED BY "," INTO items(1), items(2), 
       items(3), items(4), items(5)
       DISPLAY "Items in reverse order:"
       PERFORM VARYING i FROM 4 BY -1 UNTIL NOT (i >= 0)
       DISPLAY items(i + 1)
       END-PERFORM.
       EXIT.
       STOP RUN.

