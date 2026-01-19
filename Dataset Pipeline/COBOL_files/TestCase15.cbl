       IDENTIFICATION DIVISION.
       PROGRAM-ID. TestCase15.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:BLOCK_METHOD_REVERSESTRING_CLASS_TEST_GLOBAL
       01  original_reverseString PIC X(100).
       01  reversed_reverseString PIC X(100).
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.


       PROCEDURE DIVISION.


       reverseString-PARA.
       MOVE "CobolMapping" TO original_reverseString
       DISPLAY "Original: "   original_reverseString
       DISPLAY "Reversed: "   reversed_reverseString
       EXIT.

       MAIN-PARA.
       PERFORM REVERSESTRING-PARA
       EXIT.
       STOP RUN.

