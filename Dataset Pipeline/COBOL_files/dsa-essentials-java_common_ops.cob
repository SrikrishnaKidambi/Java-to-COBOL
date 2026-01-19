       IDENTIFICATION DIVISION.
       PROGRAM-ID. dsa-essentials-java_common_ops.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_GETITHBIT_CLASS_COMMON_OPS_GLOBAL
       01  n_getIthBit     PIC S9(5).
       01  i_getIthBit     PIC S9(5).
      * Variables for Scope:BLOCK_METHOD_GETITHBIT_CLASS_COMMON_OPS_GLOBAL
       01  mask_getIthBit  PIC S9(5).
      * Variables for Scope:METHOD_SETITHBIT_CLASS_COMMON_OPS_GLOBAL
       01  n_setIthBit     PIC S9(5).
       01  i_setIthBit     PIC S9(5).
      * Variables for Scope:BLOCK_METHOD_SETITHBIT_CLASS_COMMON_OPS_GLOBAL
       01  mask_setIthBit  PIC S9(5).
      * Variables for Scope:METHOD_CLEARITHBIT_CLASS_COMMON_OPS_GLOBAL
       01  n_clearIthBit   PIC S9(5).
       01  i_clearIthBit   PIC S9(5).
      * Variables for Scope:BLOCK_METHOD_CLEARITHBIT_CLASS_COMMON_OPS_GLOBAL
       01  mask_clearIthBit PIC S9(5).
      * Variables for Scope:METHOD_UPDATEITHBIT_CLASS_COMMON_OPS_GLOBAL
       01  n_updateIthBit  PIC S9(5).
       01  i_updateIthBit  PIC S9(5).
       01  v_updateIthBit  PIC S9(5).
      * Variables for Scope:BLOCK_METHOD_UPDATEITHBIT_CLASS_COMMON_OPS_GLOBAL
       01  mask_updateIthBit PIC S9(5).
      * Variables for Scope:METHOD_CLEARLASTIBITS_CLASS_COMMON_OPS_GLOBAL
       01  n_clearLastIBits PIC S9(5).
       01  i_clearLastIBits PIC S9(5).
      * Variables for Scope:BLOCK_METHOD_CLEARLASTIBITS_CLASS_COMMON_OPS_GLOBAL
       01  mask_clearLastIBits PIC S9(5).
      * Variables for Scope:METHOD_CLEARBITSINRANGE_CLASS_COMMON_OPS_GLOBAL
       01  n_clearBitsInRange PIC S9(5).
       01  i_clearBitsInRange PIC S9(5).
       01  j_clearBitsInRange PIC S9(5).
      * Variables for Scope:BLOCK_METHOD_CLEARBITSINRANGE_CLASS_COMMON_OPS_GLOBAL
       01  a_clearBitsInRange PIC S9(5).
       01  b_clearBitsInRange PIC S9(5).
       01  mask_clearBitsInRange PIC S9(5).
      * Variables for Scope:METHOD_MAIN_CLASS_COMMON_OPS_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_COMMON_OPS_GLOBAL
       01  n_main          PIC S9(5).
       01  scanner_main    PIC X(100).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       getIthBit-PARA.
       EXIT.


       setIthBit-PARA.
       COMPUTE n_setIthBit = mask_setIthBit
       EXIT.


       clearIthBit-PARA.
       COMPUTE n_clearIthBit = mask_clearIthBit
       EXIT.


       updateIthBit-PARA.
       MOVE n_updateIthBit TO n_clearIthBit
       MOVE i_updateIthBit TO i_clearIthBit
       PERFORM clearIthBit-PARA
      * sets the right value
       COMPUTE n_updateIthBit = mask_updateIthBit
       EXIT.


       clearLastIBits-PARA.
       COMPUTE TEMP_0 = 1 - i_clearLastIBits
       COMPUTE mask_clearLastIBits = TEMP_0
       COMPUTE n_clearLastIBits = mask_clearLastIBits
       EXIT.


       clearBitsInRange-PARA.
       COMPUTE TEMP_1 = j_clearBitsInRange + 1
       COMPUTE a_clearBitsInRange = TEMP_1
       COMPUTE TEMP_2 = i_clearBitsInRange - 1
       COMPUTE b_clearBitsInRange = TEMP_2
       COMPUTE n_clearBitsInRange = mask_clearBitsInRange
       EXIT.


       MAIN-PARA.
       MOVE 31 TO n_main
      * Input from ODT is enabled
       EXIT.


