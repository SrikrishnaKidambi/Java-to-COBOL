       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_Premium_DecimalToBinary.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_DECIMALTOBINARY_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_DECIMALTOBINARY_GLOBAL
       01  s_main          PIC X(100).
       01  n_main          PIC S9(5).
       01  binary_main     PIC S9(5).
       01  placevalue_main PIC S9(5).
      * Variables for Scope:BLOCK_WHILE_BLOCK_METHOD_MAIN_CLASS_DECIMALTOBINARY_GLOBAL
       01  remainder_main  PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * TODO Auto-generated method stub
      * Input from ODT is enabled
       ACCEPT n_main
       MOVE 0 TO binary_main
       MOVE 1 TO placevalue_main
       PERFORM UNTIL NOT (n_main > 0)
       DIVIDE n_main BY 2 GIVING remainder_main REMAINDER remainder_main
       COMPUTE TEMP_0 = remainder_main * placevalue_main
       COMPUTE TEMP_1 = binary_main + TEMP_0
       COMPUTE binary_main = TEMP_1
       MULTIPLY placevalue_main BY 10 GIVING placevalue_main
       DIVIDE n_main BY 2 GIVING n_main
       END-PERFORM
       DISPLAY binary_main
       EXIT.


