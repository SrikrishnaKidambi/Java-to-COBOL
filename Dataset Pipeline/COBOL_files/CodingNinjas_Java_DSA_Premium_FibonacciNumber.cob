       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_Premium_FibonacciNumber.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_CHECKMEMBER_CLASS_SOLUTION_CLASS_FIBONACCINUMBER_GLOBAL
       01  n_checkMember   PIC S9(5).
      * Variables for Scope:BLOCK_METHOD_CHECKMEMBER_CLASS_SOLUTION_CLASS_FIBONACCINUMBER_GLOBAL
       01  a_checkMember   PIC S9(5).
       01  b_checkMember   PIC S9(5).
       01  c_checkMember   PIC S9(5).
      * Variables for Scope:METHOD_MAIN_CLASS_FIBONACCINUMBER_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_FIBONACCINUMBER_GLOBAL
       01  s_main          PIC X(100).
       01  n_main          PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       checkMember-PARA.
      * Your class should be named Solution
			* Don't write main().
		 	* Don't read input, it is passed as function argument.
		 	* Return output and don't print it.
		 	* Taking input and printing output is handled automatically.
       MOVE 0 TO a_checkMember
       MOVE 1 TO b_checkMember
       PERFORM UNTIL NOT (a_checkMember < n_checkMember)
       ADD a_checkMember TO b_checkMember GIVING c_checkMember
       MOVE b_checkMember TO a_checkMember
       MOVE c_checkMember TO b_checkMember
       END-PERFORM
       IF a_checkMember = n_checkMember
       ELSE
       END-IF
       EXIT.


       MAIN-PARA.
      * TODO Auto-generated method stub
      * Input from ODT is enabled
       ACCEPT n_main
       DISPLAY Solution.checkMember(n_main)
       EXIT.


