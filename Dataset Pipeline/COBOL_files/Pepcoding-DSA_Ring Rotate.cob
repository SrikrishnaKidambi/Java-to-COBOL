       IDENTIFICATION DIVISION.
       PROGRAM-ID. Pepcoding-DSA_Ring Rotate.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  scn_main        PIC X(100).
       01  n_main          PIC S9(5).
       01  m_main          PIC S9(5).
       01  ARR_MAIN_[SIZE=[N_MAIN,M_MAIN]]-ARRAY.
           05  arr_main     PIC S9(5) OCCURS 100 TIMES.
       01  s_main          PIC S9(5).
       01  r_main          PIC S9(5).
       01  ONED_MAIN_-ARRAY.
           05  oneD_main    PIC S9(5) OCCURS 100 TIMES.
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  rows_main       PIC S9(5).
      * Variables for Scope:FOR_BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  cols_main       PIC S9(5).
      * Variables for Scope:METHOD_GETSHELL_CLASS_MAIN_GLOBAL
       01  ARR_GETSHELL_-ARRAY.
           05  arr_getShell PIC S9(5) OCCURS 100 TIMES.
       01  s_getShell      PIC S9(5).
      * Variables for Scope:BLOCK_METHOD_GETSHELL_CLASS_MAIN_GLOBAL
       01  n_getShell      PIC S9(5).
       01  m_getShell      PIC S9(5).
       01  frow_getShell   PIC S9(5).
       01  fcol_getShell   PIC S9(5).
       01  lrow_getShell   PIC S9(5).
       01  lcol_getShell   PIC S9(5).
       01  size_getShell   PIC S9(5).
       01  ONED_GETSHELL_[SIZE=[SIZE_GETSHELL]]-ARRAY.
           05  oneD_getShell PIC S9(5) OCCURS 100 TIMES.
       01  counter_getShell PIC S9(5).
      * Variables for Scope:FOR_BLOCK_WHILE_BLOCK_METHOD_GETSHELL_CLASS_MAIN_GLOBAL
       01  i_getShell      PIC S9(5).
       01  j_getShell      PIC S9(5).
      * Variables for Scope:BLOCK_FOR_BLOCK_WHILE_BLOCK_METHOD_GETSHELL_CLASS_MAIN_GLOBAL
       01  j_getShell      PIC S9(5).
       01  i_getShell      PIC S9(5).
      * Variables for Scope:METHOD_SWAP_CLASS_MAIN_GLOBAL
       01  ARR_SWAP_-ARRAY.
           05  arr_swap     PIC S9(5) OCCURS 100 TIMES.
       01  left_swap       PIC S9(5).
       01  right_swap      PIC S9(5).
      * Variables for Scope:BLOCK_METHOD_SWAP_CLASS_MAIN_GLOBAL
       01  temp_swap       PIC S9(5).
      * Variables for Scope:METHOD_REVERSE_CLASS_MAIN_GLOBAL
       01  ARR_REVERSE_-ARRAY.
           05  arr_reverse  PIC S9(5) OCCURS 100 TIMES.
       01  left_reverse    PIC S9(5).
       01  right_reverse   PIC S9(5).
      * Variables for Scope:METHOD_ROTATE_CLASS_MAIN_GLOBAL
       01  A_ROTATE_-ARRAY.
           05  a_rotate     PIC S9(5) OCCURS 100 TIMES.
       01  k_rotate        PIC S9(5).
      * Variables for Scope:BLOCK_METHOD_ROTATE_CLASS_MAIN_GLOBAL
       01  n_rotate        PIC S9(5).
      * Variables for Scope:METHOD_FILLSHELL_CLASS_MAIN_GLOBAL
       01  ARR_FILLSHELL_-ARRAY.
           05  arr_fillShell PIC S9(5) OCCURS 100 TIMES.
       01  ONED_FILLSHELL_-ARRAY.
           05  oneD_fillShell PIC S9(5) OCCURS 100 TIMES.
       01  s_fillShell     PIC S9(5).
      * Variables for Scope:BLOCK_METHOD_FILLSHELL_CLASS_MAIN_GLOBAL
       01  n_fillShell     PIC S9(5).
       01  m_fillShell     PIC S9(5).
       01  frow_fillShell  PIC S9(5).
       01  fcol_fillShell  PIC S9(5).
       01  lrow_fillShell  PIC S9(5).
       01  lcol_fillShell  PIC S9(5).
       01  size_fillShell  PIC S9(5).
       01  counter_fillShell PIC S9(5).
      * Variables for Scope:FOR_BLOCK_WHILE_BLOCK_METHOD_FILLSHELL_CLASS_MAIN_GLOBAL
       01  i_fillShell     PIC S9(5).
       01  j_fillShell     PIC S9(5).
      * Variables for Scope:BLOCK_FOR_BLOCK_WHILE_BLOCK_METHOD_FILLSHELL_CLASS_MAIN_GLOBAL
       01  j_fillShell     PIC S9(5).
       01  i_fillShell     PIC S9(5).
      * Variables for Scope:METHOD_DISPLAY_CLASS_MAIN_GLOBAL
       01  ARR_DISPLAY_-ARRAY.
           05  arr_display  PIC S9(5) OCCURS 100 TIMES.
      * Variables for Scope:FOR_BLOCK_METHOD_DISPLAY_CLASS_MAIN_GLOBAL
       01  i_display       PIC S9(5).
      * Variables for Scope:FOR_BLOCK_FOR_BLOCK_METHOD_DISPLAY_CLASS_MAIN_GLOBAL
       01  j_display       PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).
       01 TEMP_4 PIC S9(9).
       01 TEMP_5 PIC S9(9).
       01 TEMP_6 PIC S9(9).
       01 TEMP_7 PIC S9(9).
       01 TEMP_8 PIC S9(9).
       01 TEMP_9 PIC S9(9).
       01 TEMP_10 PIC S9(9).
       01 TEMP_11 PIC S9(9).
       01 TEMP_12 PIC S9(9).
       01 TEMP_13 PIC S9(9).
       01 TEMP_14 PIC S9(9).
       01 TEMP_15 PIC S9(9).
       01 TEMP_16 PIC S9(9).
       01 TEMP_17 PIC S9(9).
       01 TEMP_18 PIC S9(9).
       01 TEMP_19 PIC S9(9).
       01 TEMP_20 PIC S9(9).
       01 TEMP_21 PIC S9(9).
       01 TEMP_22 PIC S9(9).
       01 TEMP_23 PIC S9(9).
       01 TEMP_24 PIC S9(9).
       01 TEMP_25 PIC S9(9).
       01 TEMP_26 PIC S9(9).
       01 TEMP_27 PIC S9(9).
       01 TEMP_28 PIC S9(9).
       01 TEMP_29 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       getShell-PARA.
       COMPUTE TEMP_2 = lcol_getShell - fcol_getShell
       COMPUTE TEMP_3 = 2 * TEMP_2
       COMPUTE TEMP_4 = lrow_getShell - frow_getShell
       COMPUTE TEMP_5 = 2 * TEMP_4
       COMPUTE TEMP_6 = TEMP_3 + TEMP_5
       COMPUTE size_getShell = TEMP_6
       MOVE 0 TO counter_getShell
       PERFORM UNTIL NOT (counter_getShell < size_getShell)
      * left wall
       PERFORM VARYING i_getShell FROM frow_getShell BY 1 UNTIL NOT (i_getShell <= lrow_getShell)
       MOVE fcol_getShell TO j_getShell
       COMPUTE TEMP_7 = i_getShell + 1
       COMPUTE oneD_getShell(counter_getShell + 1) = j_getShell
       ADD 1 TO counter_getShell
       IF counter_getShell >= size_getShell
       END-IF
       END-PERFORM
      * Bottom - Left Element -> Duplicate
       ADD 1 TO fcol_getShell
      * bottom wall
       PERFORM VARYING j_getShell FROM fcol_getShell BY 1 UNTIL NOT (j_getShell <= lcol_getShell)
       COMPUTE TEMP_8 = i_getShell + 1
       COMPUTE oneD_getShell(counter_getShell + 1) = j_getShell
       ADD 1 TO counter_getShell
       IF counter_getShell >= size_getShell
       END-IF
       END-PERFORM
      * Bottom - right Element -> Duplicate
       SUBTRACT 1 FROM lrow_getShell
      * right wall
       PERFORM VARYING i_getShell FROM lrow_getShell BY -1 UNTIL NOT (i_getShell >= frow_getShell)
       COMPUTE TEMP_9 = i_getShell + 1
       COMPUTE oneD_getShell(counter_getShell + 1) = j_getShell
       ADD 1 TO counter_getShell
       IF counter_getShell >= size_getShell
       END-IF
       END-PERFORM
      * Top - right Element -> Duplicate
       SUBTRACT 1 FROM lcol_getShell
      * top wall
       PERFORM VARYING j_getShell FROM lcol_getShell BY -1 UNTIL NOT (j_getShell >= fcol_getShell)
       COMPUTE TEMP_10 = i_getShell + 1
       COMPUTE oneD_getShell(counter_getShell + 1) = j_getShell
       ADD 1 TO counter_getShell
       IF counter_getShell >= size_getShell
       END-IF
       END-PERFORM
       END-PERFORM
       EXIT.


       swap-PARA.
       MOVE arr_swap(left_swap + 1) TO temp_swap
       COMPUTE TEMP_11 = right_swap + 1
       COMPUTE arr_swap(left_swap + 1) = TEMP_11
       COMPUTE arr_swap(right_swap + 1) = temp_swap
       EXIT.


       reverse-PARA.
       PERFORM UNTIL NOT (left_reverse < right_reverse)
       MOVE arr_reverse TO arr_swap
       MOVE left_reverse TO left_swap
       MOVE right_reverse TO right_swap
       PERFORM swap-PARA
       ADD 1 TO left_reverse
       SUBTRACT 1 FROM right_reverse
       END-PERFORM
       EXIT.


       rotate-PARA.
      * write your code here
       DIVIDE k_rotate BY n_rotate GIVING TEMP_12 REMAINDER TEMP_13
       COMPUTE TEMP_14 = TEMP_13 + n_rotate
       DIVIDE TEMP_14 BY n_rotate GIVING TEMP_15 REMAINDER TEMP_16
       COMPUTE k_rotate = TEMP_16
      * First n-k elements
       MOVE a_rotate TO arr_reverse
       MOVE 0 TO left_reverse
       COMPUTE TEMP_18 = n_rotate - k_rotate
       COMPUTE TEMP_19 = TEMP_18 - 1
       COMPUTE TEMP_17 = TEMP_19
       MOVE TEMP_17 TO right_reverse
       PERFORM reverse-PARA
      * Last k elements
       MOVE a_rotate TO arr_reverse
       SUBTRACT k_rotate FROM n_rotate GIVING TEMP_20
       MOVE TEMP_20 TO left_reverse
       SUBTRACT 1 FROM n_rotate GIVING TEMP_21
       MOVE TEMP_21 TO right_reverse
       PERFORM reverse-PARA
      * Whole array
       MOVE a_rotate TO arr_reverse
       MOVE 0 TO left_reverse
       SUBTRACT 1 FROM n_rotate GIVING TEMP_22
       MOVE TEMP_22 TO right_reverse
       PERFORM reverse-PARA
       EXIT.


       fillShell-PARA.
       COMPUTE TEMP_23 = lcol_fillShell - fcol_fillShell
       COMPUTE TEMP_24 = 2 * TEMP_23
       COMPUTE TEMP_25 = lrow_fillShell - frow_fillShell
       COMPUTE TEMP_26 = 2 * TEMP_25
       COMPUTE TEMP_27 = TEMP_24 + TEMP_26
       COMPUTE size_fillShell = TEMP_27
       MOVE 0 TO counter_fillShell
       PERFORM UNTIL NOT (counter_fillShell < size_fillShell)
      * left wall
       PERFORM VARYING i_fillShell FROM frow_fillShell BY 1 UNTIL NOT (i_fillShell <= lrow_fillShell)
       MOVE fcol_fillShell TO j_fillShell
       ADD 1 TO counter_fillShell
       IF counter_fillShell >= size_fillShell
       GOBACK
       END-IF
       END-PERFORM
      * Bottom - Left Element -> Duplicate
       ADD 1 TO fcol_fillShell
      * bottom wall
       PERFORM VARYING j_fillShell FROM fcol_fillShell BY 1 UNTIL NOT (j_fillShell <= lcol_fillShell)
       ADD 1 TO counter_fillShell
       IF counter_fillShell >= size_fillShell
       GOBACK
       END-IF
       END-PERFORM
      * Bottom - right Element -> Duplicate
       SUBTRACT 1 FROM lrow_fillShell
      * right wall
       PERFORM VARYING i_fillShell FROM lrow_fillShell BY -1 UNTIL NOT (i_fillShell >= frow_fillShell)
       ADD 1 TO counter_fillShell
       IF counter_fillShell >= size_fillShell
       GOBACK
       END-IF
       END-PERFORM
      * Top - right Element -> Duplicate
       SUBTRACT 1 FROM lcol_fillShell
      * top wall
       PERFORM VARYING j_fillShell FROM lcol_fillShell BY -1 UNTIL NOT (j_fillShell >= fcol_fillShell)
       ADD 1 TO counter_fillShell
       IF counter_fillShell >= size_fillShell
       GOBACK
       END-IF
       END-PERFORM
       END-PERFORM
       EXIT.


       display-PARA.
       PERFORM VARYING i_display FROM 0 BY 1 UNTIL NOT (i_display < arr_display.length)
       PERFORM VARYING j_display FROM 0 BY 1 UNTIL NOT (j_display < arr_display[0].length)
       COMPUTE TEMP_29 = i_display + 1
       COMPUTE TEMP_28 = j_display
       DISPLAY TEMP_28 WITH NO ADVANCING
       DISPLAY " " WITH NO ADVANCING
       END-PERFORM
       END-PERFORM
       EXIT.


       MAIN-PARA.
      * write your code here
      * Input from ODT is enabled
      * Declaration & Initialization
       ACCEPT n_main
       ACCEPT m_main
      * INPUT
       COMPUTE TEMP_0 = n_main - 1
       PERFORM VARYING rows_main FROM 0 BY 1 UNTIL NOT (rows_main <= TEMP_0)
       COMPUTE TEMP_1 = m_main - 1
       PERFORM VARYING cols_main FROM 0 BY 1 UNTIL NOT (cols_main <= TEMP_1)
       ACCEPT arr_main(rows_main + 1)[cols_main]
       COMPUTE TEMP_1 = m_main - 1
       END-PERFORM
       COMPUTE TEMP_0 = n_main - 1
       END-PERFORM
       ACCEPT s_main
       ACCEPT r_main
       PERFORM rotate-PARA
       PERFORM fillShell-PARA
       PERFORM display-PARA
       EXIT.


