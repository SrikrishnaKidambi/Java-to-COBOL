       IDENTIFICATION DIVISION.
       PROGRAM-ID. Java-DSA-Bootcamp_NestedSwitch.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_NESTEDSWITCH_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_NESTEDSWITCH_GLOBAL
       01  in_main         PIC X(100).
       01  empID_main      PIC S9(5).
       01  department_main PIC X(100).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
       ACCEPT empID_main
       ACCEPT department_main
       EVALUATE empID_main
       WHEN 1
       DISPLAY "Kunal Kushwaha"
       WHEN 2
       DISPLAY "Rahul Rana"
       WHEN 3
       DISPLAY "Emp Number 3"
       EVALUATE department_main
       WHEN "IT"
       DISPLAY "IT Department"
       WHEN "Management"
       DISPLAY "Management Department"
       WHEN OTHER
       DISPLAY "No department entered"
       END-EVALUATE
       WHEN OTHER
       DISPLAY "Enter correct EmpID"
       END-EVALUATE
      * better way to write
       DISPLAY "Kunal Kushwaha"
       DISPLAY "Rahul Rana"
       DISPLAY "Emp Number 3"
       DISPLAY "IT Department"
       DISPLAY "Management Department"
       DISPLAY "No department entered"
       DISPLAY "Enter correct EmpID"
       EXIT.


