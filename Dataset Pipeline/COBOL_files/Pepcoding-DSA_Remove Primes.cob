       IDENTIFICATION DIVISION.
       PROGRAM-ID. Pepcoding-DSA_Remove Primes.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_ISPRIME_CLASS_MAIN_GLOBAL
       01  val_isPrime     PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_ISPRIME_CLASS_MAIN_GLOBAL
       01  i_isPrime       PIC S9(5).
      * Variables for Scope:METHOD_SOLUTION_CLASS_MAIN_GLOBAL
       01  al_solution     PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_SOLUTION_CLASS_MAIN_GLOBAL
       01  idx_solution    PIC S9(5).
      * Variables for Scope:METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  scn_main        PIC X(100).
       01  n_main          PIC S9(5).
       01  al_main         PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  i_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       isPrime-PARA.
       COMPUTE TEMP_0 = i_isPrime * i_isPrime
       PERFORM VARYING i_isPrime FROM 2 BY 1 UNTIL NOT (TEMP_0 <= val_isPrime)
       DIVIDE val_isPrime BY i_isPrime GIVING TEMP_1 REMAINDER TEMP_1
       IF TEMP_1 = 0
       END-IF
       COMPUTE TEMP_0 = i_isPrime * i_isPrime
       END-PERFORM
       EXIT.


       solution-PARA.
      * Loop from right to left: to avoid skipping elements
       PERFORM VARYING idx_solution FROM al_solution BY -1 UNTIL NOT (idx_solution >= 0)
       COMPUTE TEMP_2 = size - 1
       COMPUTE idx_solution = TEMP_2
       IF isPrime(al_solution.get(idx_solution))
       END-IF
       END-PERFORM
       EXIT.


       MAIN-PARA.
      * Input from ODT is enabled
       ACCEPT n_main
       PERFORM VARYING i_main FROM 0 BY 1 UNTIL NOT (i_main < n_main)
       END-PERFORM
       MOVE al_main TO al_solution
       PERFORM solution-PARA
       DISPLAY al_main
       EXIT.


