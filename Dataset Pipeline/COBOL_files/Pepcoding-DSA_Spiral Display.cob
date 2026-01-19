       IDENTIFICATION DIVISION.
       PROGRAM-ID. Pepcoding-DSA_Spiral Display.


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
       01  frow_main       PIC S9(5).
       01  lrow_main       PIC S9(5).
       01  fcol_main       PIC S9(5).
       01  lcol_main       PIC S9(5).
       01  counter_main    PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  rows_main       PIC S9(5).
      * Variables for Scope:FOR_BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  cols_main       PIC S9(5).
      * Variables for Scope:FOR_BLOCK_WHILE_BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  i_main          PIC S9(5).
       01  j_main          PIC S9(5).
      * Variables for Scope:BLOCK_FOR_BLOCK_WHILE_BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  j_main          PIC S9(5).
       01  i_main          PIC S9(5).
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


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


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
       MOVE 0 TO counter_main
       COMPUTE TEMP_2 = n_main * m_main
       PERFORM UNTIL NOT (counter_main < TEMP_2)
      * left wall
       PERFORM VARYING i_main FROM frow_main BY 1 UNTIL NOT (i_main <= lrow_main)
       MOVE fcol_main TO j_main
       COMPUTE TEMP_4 = i_main + 1
       COMPUTE TEMP_3 = j_main
       DISPLAY TEMP_3
       ADD 1 TO counter_main
       IF counter_main = n_main * m_main
       GOBACK
       END-IF
       END-PERFORM
      * Bottom - Left Element -> Duplicate
       ADD 1 TO fcol_main
      * bottom wall
       PERFORM VARYING j_main FROM fcol_main BY 1 UNTIL NOT (j_main <= lcol_main)
       COMPUTE TEMP_6 = i_main + 1
       COMPUTE TEMP_5 = j_main
       DISPLAY TEMP_5
       ADD 1 TO counter_main
       IF counter_main >= n_main * m_main
       GOBACK
       END-IF
       END-PERFORM
      * Bottom - right Element -> Duplicate
       SUBTRACT 1 FROM lrow_main
      * right wall
       PERFORM VARYING i_main FROM lrow_main BY -1 UNTIL NOT (i_main >= frow_main)
       COMPUTE TEMP_8 = i_main + 1
       COMPUTE TEMP_7 = j_main
       DISPLAY TEMP_7
       ADD 1 TO counter_main
       IF counter_main >= n_main * m_main
       GOBACK
       END-IF
       END-PERFORM
      * Top - right Element -> Duplicate
       SUBTRACT 1 FROM lcol_main
      * top wall
       PERFORM VARYING j_main FROM lcol_main BY -1 UNTIL NOT (j_main >= fcol_main)
       COMPUTE TEMP_10 = i_main + 1
       COMPUTE TEMP_9 = j_main
       DISPLAY TEMP_9
       ADD 1 TO counter_main
       IF counter_main >= n_main * m_main
       GOBACK
       END-IF
       END-PERFORM
      * Updation Condition? - for next shell
       ADD 1 TO frow_main
       COMPUTE TEMP_2 = n_main * m_main
       END-PERFORM
       GOBACK
       EXIT.


