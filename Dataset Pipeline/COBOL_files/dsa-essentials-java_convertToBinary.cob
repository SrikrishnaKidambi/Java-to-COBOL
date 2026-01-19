       IDENTIFICATION DIVISION.
       PROGRAM-ID. dsa-essentials-java_convertToBinary.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_CONVERTTOBINARY_CLASS_CONVERTTOBINARY_GLOBAL
       01  n_convertTobinary PIC S9(5).
      * Variables for Scope:BLOCK_METHOD_CONVERTTOBINARY_CLASS_CONVERTTOBINARY_GLOBAL
       01  ans_convertTobinary PIC S9(5).
       01  p_convertTobinary PIC S9(5).
      * Variables for Scope:BLOCK_WHILE_BLOCK_METHOD_CONVERTTOBINARY_CLASS_CONVERTTOBINARY_GLOBAL
       01  last_bit_convertTobinary PIC S9(5).
      * Variables for Scope:METHOD_MAIN_CLASS_CONVERTTOBINARY_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_CONVERTTOBINARY_GLOBAL
       01  scanner_main    PIC X(100).
       01  n_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       convertTobinary-PARA.
       MOVE 0 TO ans_convertTobinary
       MOVE 1 TO p_convertTobinary
       PERFORM UNTIL NOT (n_convertTobinary > 0)
       COMPUTE TEMP_0 = p_convertTobinary * last_bit_convertTobinary
       COMPUTE TEMP_1 = ans_convertTobinary + TEMP_0
       COMPUTE ans_convertTobinary = TEMP_1
       MULTIPLY p_convertTobinary BY 10 GIVING p_convertTobinary
       COMPUTE n_convertTobinary = 1
       END-PERFORM
       EXIT.


       MAIN-PARA.
      * Input from ODT is enabled
       ACCEPT n_main
       DISPLAY convertTobinary(n_main)
       EXIT.


