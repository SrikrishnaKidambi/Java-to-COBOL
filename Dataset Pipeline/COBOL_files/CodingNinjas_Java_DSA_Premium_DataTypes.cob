       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_Premium_DataTypes.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_DATATYPES_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_DATATYPES_GLOBAL
       01  c_main          PIC S9(5).
       01  d_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * TODO Auto-generated method stub
       COMPUTE TEMP_0 = 3 * 2
       COMPUTE TEMP_1 = TEMP_0 / 3
       COMPUTE c_main = TEMP_1
      * will give output 2 because of associativity 3*2 will be done first, and then /3 will be done.
      * the execution flows from left to right.
      * here 3/3 is done first after that 1*2 is 2 and we get the answer.
       COMPUTE TEMP_2 = 3 / 3
       COMPUTE TEMP_3 = TEMP_2 * 2
       COMPUTE d_main = TEMP_3
       DISPLAY d_main WITH NO ADVANCING
       EXIT.


