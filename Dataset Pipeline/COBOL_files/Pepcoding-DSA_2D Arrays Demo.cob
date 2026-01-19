       IDENTIFICATION DIVISION.
       PROGRAM-ID. Pepcoding-DSA_2D Arrays Demo.


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
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  rows_main       PIC S9(5).
       01  i_main          PIC S9(5).
      * Variables for Scope:FOR_BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  cols_main       PIC S9(5).
       01  j_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
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
      * OUTPUT
       PERFORM VARYING i_main FROM 0 BY 1 UNTIL NOT (i_main < n_main)
       PERFORM VARYING j_main FROM 0 BY 1 UNTIL NOT (j_main < m_main)
       COMPUTE TEMP_3 = i_main + 1
       COMPUTE TEMP_2 = j_main
       DISPLAY TEMP_2 WITH NO ADVANCING
       DISPLAY " " WITH NO ADVANCING
       END-PERFORM
       END-PERFORM
       EXIT.


