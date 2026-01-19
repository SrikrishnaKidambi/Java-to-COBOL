       IDENTIFICATION DIVISION.
       PROGRAM-ID. Java-DSA-Bootcamp_Calculator.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_CALCULATOR_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_CALCULATOR_GLOBAL
       01  in_main         PIC X(100).
       01  ans_main        PIC S9(5).
      * Variables for Scope:BLOCK_WHILE_BLOCK_METHOD_MAIN_CLASS_CALCULATOR_GLOBAL
       01  op_main         PIC X(1).
      * Variables for Scope:BLOCK_IF_BLOCK_WHILE_BLOCK_METHOD_MAIN_CLASS_CALCULATOR_GLOBAL
       01  num1_main       PIC S9(5).
       01  num2_main       PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
      * Take input from user till user does not press X or x
       MOVE 0 TO ans_main
       PERFORM UNTIL NOT (true)
      * take the operator as input
       DISPLAY "Enter the operator: " WITH NO ADVANCING
       MOVE FUNCTION CHAR(in_main.next().trim().charAt(0)) TO op_main
       IF op_main = '+'  OR  op_main = '-'  OR  op_main = '*'  OR  op_main = '/'  OR  op_main = '%'
      * input two numbers
       DISPLAY "Enter two numbers: " WITH NO ADVANCING
       ACCEPT num1_main
       ACCEPT num2_main
       IF op_main = '+'
       ADD num1_main TO num2_main GIVING ans_main
       END-IF
       IF op_main = '-'
       SUBTRACT num2_main FROM num1_main GIVING ans_main
       END-IF
       IF op_main = '*'
       MULTIPLY num1_main BY num2_main GIVING ans_main
       END-IF
       IF op_main = '/'
       IF num2_main != 0
       DIVIDE num1_main BY num2_main GIVING ans_main
       END-IF
       END-IF
       IF op_main = '%'
       DIVIDE num1_main BY num2_main GIVING ans_main REMAINDER ans_main
       END-IF
       ELSE
       IF op_main = 'x'  OR  op_main = 'X'
       EXIT PERFORM
       ELSE
       DISPLAY "Invalid operation!!"
       END-IF
       END-IF
       DISPLAY ans_main
       END-PERFORM
       EXIT.


