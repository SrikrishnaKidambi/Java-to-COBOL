       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_NumberSequence.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  scan_main       PIC X(100).
       01  n_main          PIC S9(5).
       01  ARR_MAIN_[SIZE=[N_MAIN]]-ARRAY.
           05  arr_main     PIC S9(5) OCCURS 100 TIMES.
       01  i_main          PIC S9(5).
       01  check_main      PIC X(1).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  i_main          PIC S9(5).
       01  j_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Write your code here
      * Input from ODT is enabled
       ACCEPT n_main
       PERFORM VARYING i_main FROM 0 BY 1 UNTIL NOT (i_main < n_main)
       ACCEPT arr_main(i_main + 1)
       END-PERFORM
       MOVE 'Y' TO check_main
       COMPUTE TEMP_0 = n_main - 1
       PERFORM VARYING i_main FROM 0 BY 1 UNTIL NOT (i_main < TEMP_0)
      * System.out.println("Elements compared at position "+ i + " and position "+ (i+1) + " : " + arr[i] +" " + arr[i+1]);
       IF arr_main[i_main] <= arr_main[i_main + 1]
      * System.out.println("Loop for strictly decreasing broken at "+ i);
       EXIT PERFORM
       END-IF
       COMPUTE TEMP_0 = n_main - 1
       END-PERFORM
      * System.out.println("Starting loop for strictly increasing from from position "+i);
       COMPUTE TEMP_1 = n_main - 1
       PERFORM VARYING j_main FROM i_main BY 1 UNTIL NOT (j_main < TEMP_1)
      * System.out.println("Elements compared at position "+ j + " and position "+ (j+1) + " : " + arr[j] +" " + arr[j+1]);
       IF arr_main[j_main] >= arr_main[j_main + 1]
      * System.out.println("Loop broken at "+i);
       MOVE 'N' TO check_main
       EXIT PERFORM
       END-IF
       COMPUTE TEMP_1 = n_main - 1
       END-PERFORM
       DISPLAY check_main
       EXIT.


