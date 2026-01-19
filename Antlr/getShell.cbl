       IDENTIFICATION DIVISION.
       PROGRAM-ID. getShell.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Method:getShell
           05  n_getShell   PIC S9(5).
           05  m_getShell   PIC S9(5).
           05  frow_getShell PIC S9(5).
           05  fcol_getShell PIC S9(5).
           05  lrow_getShell PIC S9(5).
           05  lcol_getShell PIC S9(5).
           05  size_getShell PIC S9(5).
       01  ONED_GETSHELL_[SIZE=[SIZE_GETSHELL]]-ARRAY.
           05  oneD_getShell PIC S9(5) OCCURS 100 TIMES
           05  counter_getShell PIC S9(5).
           05  i_getShell   PIC S9(5).
           05  j_getShell   PIC S9(5).
           05  j_getShell   PIC S9(5).
           05  i_getShell   PIC S9(5).
       01  ARR_SWAP_[SIZE=[]]-ARRAY.
           05  arr_swap     PIC S9(5) OCCURS 100 TIMES
           05  left_swap    PIC S9(5).
           05  right_swap   PIC S9(5).
