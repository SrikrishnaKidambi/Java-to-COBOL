       IDENTIFICATION DIVISION.
       PROGRAM-ID. fillShell.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Method:fillShell
           05  n_fillShell  PIC S9(5).
           05  m_fillShell  PIC S9(5).
           05  frow_fillShell PIC S9(5).
           05  fcol_fillShell PIC S9(5).
           05  lrow_fillShell PIC S9(5).
           05  lcol_fillShell PIC S9(5).
           05  size_fillShell PIC S9(5).
           05  counter_fillShell PIC S9(5).
           05  i_fillShell  PIC S9(5).
           05  j_fillShell  PIC S9(5).
           05  j_fillShell  PIC S9(5).
           05  i_fillShell  PIC S9(5).
       01  ARR_DISPLAY_[SIZE=[]]-ARRAY.
           05  arr_display  PIC S9(5) OCCURS 100 TIMES
