       IDENTIFICATION DIVISION.
       PROGRAM-ID. Java-DSA-Bootcamp_Max.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_MAX_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_MAX_GLOBAL
       01  ARR_MAIN_-ARRAY.
           05  arr_main     PIC S9(5) OCCURS 100 TIMES.
      * Variables for Scope:METHOD_MAXRANGE_CLASS_MAX_GLOBAL
       01  ARR_MAXRANGE_-ARRAY.
           05  arr_maxRange PIC S9(5) OCCURS 100 TIMES.
       01  start_maxRange  PIC S9(5).
       01  end_maxRange    PIC S9(5).
      * Variables for Scope:BLOCK_METHOD_MAXRANGE_CLASS_MAX_GLOBAL
       01  maxVal_maxRange PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAXRANGE_CLASS_MAX_GLOBAL
       01  i_maxRange      PIC S9(5).
      * Variables for Scope:METHOD_MAX_CLASS_MAX_GLOBAL
       01  ARR_MAX_-ARRAY .
           05  arr_max      PIC S9(5) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAX_CLASS_MAX_GLOBAL
       01  maxVal_max      PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAX_CLASS_MAX_GLOBAL
       01  i_max           PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       maxRange-PARA.
       IF start_maxRange > end_maxRange
       END-IF
       IF arr_maxRange = null
       END-IF
       MOVE arr_maxRange(start_maxRange + 1) TO maxVal_maxRange
       PERFORM VARYING i_maxRange FROM start_maxRange BY 1 UNTIL NOT (i_maxRange <= end_maxRange)
       IF arr_maxRange[i_maxRange] > maxVal_maxRange
       MOVE arr_maxRange(i_maxRange + 1) TO maxVal_maxRange
       END-IF
       END-PERFORM
       EXIT.


       max-PARA.
       IF arr_max.length = 0
       END-IF
       MOVE arr_max(1) TO maxVal_max
       PERFORM VARYING i_max FROM 1 BY 1 UNTIL NOT (i_max < arr_max.length)
       IF arr_max[i_max] > maxVal_max
       MOVE arr_max(i_max + 1) TO maxVal_max
       END-IF
       END-PERFORM
       EXIT.


       MAIN-PARA.
       DISPLAY maxRange(arr_main, 1, 3)
       EXIT.


