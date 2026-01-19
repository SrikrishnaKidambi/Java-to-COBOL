       IDENTIFICATION DIVISION.
       PROGRAM-ID. Java-DSA-Bootcamp_Main.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  a_main          PIC S9(5).
       01  rno1_main       PIC S9(5).
       01  rno2_main       PIC S9(5).
       01  rno3_main       PIC S9(5).
       01  ROS_MAIN_-ARRAY.
           05  ros_main     PIC S9(5) OCCURS 100 TIMES.
       01  name_main       PIC X(100).
       01  arr_main-ARRAY .
           05  arr_main     PIC X(100) OCCURS 4 TIMES.


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Q: store a roll number
       MOVE 19 TO a_main
      * Q: store a person's name
       MOVE "Kunal Kushwaha" TO name_main
      * Q: store 5 roll numbers
       MOVE 23 TO rno1_main
       MOVE 55 TO rno2_main
       MOVE 18 TO rno3_main
      * syntax
      * datatype[] variable_name = new datatype[size];
      * store 5 roll numbers:
      * int[] rnos = new int[5];
      * // or directly
      * int[] rnos2 = {23, 12, 45, 32, 15};
      * declaration of array. ros is getting defined in the stack
      * initialisation: actually here object is being created in the memory (heap)
       COMPUTE ros_main = 6
      * System.out.println(ros[1]);
       DISPLAY arr_main(1)
       EXIT.


