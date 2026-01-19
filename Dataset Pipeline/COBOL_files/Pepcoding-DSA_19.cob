       IDENTIFICATION DIVISION.
       PROGRAM-ID. Pepcoding-DSA_19.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  scn_main        PIC X(100).
       01  n_main          PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  i_main          PIC S9(5).
      * Variables for Scope:FOR_BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  j_main          PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
       ACCEPT n_main
       PERFORM VARYING i_main FROM 1 BY 1 UNTIL NOT (i_main <= n_main)
       PERFORM VARYING j_main FROM 1 BY 1 UNTIL NOT (j_main <= n_main)
       IF i_main = 1
       IF j_main <= n_main / 2 + 1  OR  j_main = n_main
       DISPLAY "*	" WITH NO ADVANCING
       ELSE
       DISPLAY "	" WITH NO ADVANCING
       END-IF
       ELSE
       IF i_main > 1  AND  i_main < n_main / 2 + 1
       IF j_main = n_main / 2 + 1  OR  j_main = n_main
       DISPLAY "*	" WITH NO ADVANCING
       ELSE
       DISPLAY "	" WITH NO ADVANCING
       END-IF
       ELSE
       IF i_main = n_main / 2 + 1
       DISPLAY "*	" WITH NO ADVANCING
       ELSE
       IF i_main > n_main / 2 + 1  AND  i_main < n_main
       IF j_main = 1  OR  j_main = n_main / 2 + 1
       DISPLAY "*	" WITH NO ADVANCING
       ELSE
       DISPLAY "	" WITH NO ADVANCING
       END-IF
      * i == n
       ELSE
       IF j_main = 1  OR  j_main >= n_main / 2 + 1
       DISPLAY "*	" WITH NO ADVANCING
       ELSE
       DISPLAY "	" WITH NO ADVANCING
       END-IF
       END-IF
       END-IF
       END-IF
       END-IF
       END-PERFORM
       END-PERFORM
       EXIT.


