       IDENTIFICATION DIVISION.
       PROGRAM-ID. dsa-essentials-java_countingBits.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_COUNT_BITS_CLASS_COUNTINGBITS_GLOBAL
       01  n_count_bits    PIC S9(5).
      * Variables for Scope:BLOCK_METHOD_COUNT_BITS_CLASS_COUNTINGBITS_GLOBAL
       01  cnt_count_bits  PIC S9(5).
      * Variables for Scope:BLOCK_WHILE_BLOCK_METHOD_COUNT_BITS_CLASS_COUNTINGBITS_GLOBAL
       01  last_bit_count_bits PIC S9(5).
      * Variables for Scope:METHOD_COUNT_BITS_HACK_CLASS_COUNTINGBITS_GLOBAL
       01  n_count_bits_hack PIC S9(5).
      * Variables for Scope:BLOCK_METHOD_COUNT_BITS_HACK_CLASS_COUNTINGBITS_GLOBAL
       01  ans_count_bits_hack PIC S9(5).
      * Variables for Scope:METHOD_MAIN_CLASS_COUNTINGBITS_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_COUNTINGBITS_GLOBAL
       01  scanner_main    PIC X(100).
       01  n_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       count_bits-PARA.
       MOVE 0 TO cnt_count_bits
       PERFORM UNTIL NOT (n_count_bits > 0)
       ADD cnt_count_bits TO last_bit_count_bits GIVING cnt_count_bits
       COMPUTE n_count_bits = 1
       END-PERFORM
       EXIT.


       count_bits_hack-PARA.
       MOVE 0 TO ans_count_bits_hack
       PERFORM UNTIL NOT (n_count_bits_hack > 0)
      * removes the last set bit from the current number
       COMPUTE TEMP_0 = n_count_bits_hack - 1
       COMPUTE n_count_bits_hack = TEMP_0
       ADD 1 TO ans_count_bits_hack
       END-PERFORM
       EXIT.


       MAIN-PARA.
      * Input from ODT is enabled
       ACCEPT n_main
       DISPLAY count_bits(n_main)
       DISPLAY count_bits_hack(n_main)
       EXIT.


