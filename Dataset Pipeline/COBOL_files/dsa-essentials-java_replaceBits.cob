       IDENTIFICATION DIVISION.
       PROGRAM-ID. dsa-essentials-java_replaceBits.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_CLEARBITSINRANGE_CLASS_REPLACEBITS_GLOBAL
       01  n_clearBitsInRange PIC S9(5).
       01  i_clearBitsInRange PIC S9(5).
       01  j_clearBitsInRange PIC S9(5).
      * Variables for Scope:BLOCK_METHOD_CLEARBITSINRANGE_CLASS_REPLACEBITS_GLOBAL
       01  a_clearBitsInRange PIC S9(5).
       01  b_clearBitsInRange PIC S9(5).
       01  mask_clearBitsInRange PIC S9(5).
      * Variables for Scope:METHOD_REPLACEBITS_CLASS_REPLACEBITS_GLOBAL
       01  n_replaceBits   PIC S9(5).
       01  i_replaceBits   PIC S9(5).
       01  j_replaceBits   PIC S9(5).
       01  m_replaceBits   PIC S9(5).
      * Variables for Scope:BLOCK_METHOD_REPLACEBITS_CLASS_REPLACEBITS_GLOBAL
       01  mask_replaceBits PIC S9(5).
      * Variables for Scope:METHOD_MAIN_CLASS_REPLACEBITS_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_REPLACEBITS_GLOBAL
       01  n_main          PIC S9(5).
       01  i_main          PIC S9(5).
       01  j_main          PIC S9(5).
       01  m_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       clearBitsInRange-PARA.
       COMPUTE TEMP_0 = j_clearBitsInRange + 1
       COMPUTE a_clearBitsInRange = TEMP_0
       COMPUTE TEMP_1 = i_clearBitsInRange - 1
       COMPUTE b_clearBitsInRange = TEMP_1
       COMPUTE n_clearBitsInRange = mask_clearBitsInRange
       EXIT.


       replaceBits-PARA.
       MOVE clearBitsInRange(n_replaceBits, i_replaceBits, j_replaceBits) TO n_replaceBits
       COMPUTE n_replaceBits = mask_replaceBits
       EXIT.


       MAIN-PARA.
       MOVE 15 TO n_main
       MOVE 1 TO i_main
       MOVE 3 TO j_main
       MOVE 2 TO m_main
       MOVE replaceBits(n_main, i_main, j_main, m_main) TO n_main
       DISPLAY n_main WITH NO ADVANCING
       EXIT.


