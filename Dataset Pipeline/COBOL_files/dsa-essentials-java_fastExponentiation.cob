       IDENTIFICATION DIVISION.
       PROGRAM-ID. dsa-essentials-java_fastExponentiation.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_FASTEXPO_CLASS_FASTEXPONENTIATION_GLOBAL
       01  a_fastExpo      PIC S9(5).
       01  n_fastExpo      PIC S9(5).
      * Variables for Scope:BLOCK_METHOD_FASTEXPO_CLASS_FASTEXPONENTIATION_GLOBAL
       01  ans_fastExpo    PIC S9(5).
      * Variables for Scope:BLOCK_WHILE_BLOCK_METHOD_FASTEXPO_CLASS_FASTEXPONENTIATION_GLOBAL
       01  last_bit_fastExpo PIC S9(5).
      * Variables for Scope:METHOD_MAIN_CLASS_FASTEXPONENTIATION_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_FASTEXPONENTIATION_GLOBAL
       01  scanner_main    PIC X(100).
       01  n_main          PIC S9(5).
       01  a_main          PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       fastExpo-PARA.
       MOVE 1 TO ans_fastExpo
       PERFORM UNTIL NOT (n_fastExpo > 0)
       IF last_bit_fastExpo = 1
       MULTIPLY ans_fastExpo BY a_fastExpo GIVING ans_fastExpo
       END-IF
       MULTIPLY a_fastExpo BY a_fastExpo GIVING a_fastExpo
       COMPUTE n_fastExpo = 1
       END-PERFORM
       EXIT.


       MAIN-PARA.
      * Input from ODT is enabled
       ACCEPT n_main
       ACCEPT a_main
       DISPLAY fastExpo(a_main, n_main)
       EXIT.


