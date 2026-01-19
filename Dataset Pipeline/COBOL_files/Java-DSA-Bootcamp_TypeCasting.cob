       IDENTIFICATION DIVISION.
       PROGRAM-ID. Java-DSA-Bootcamp_TypeCasting.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TYPECASTING_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TYPECASTING_GLOBAL
       01  input_main      PIC X(100).
       01  num_main        PIC S9(5).
       01  i_main          PIC S9(5).
       01  b_main          PIC X(100).
       01  c_main          PIC X(1).
       01  s_main          PIC X(100).
       01  f_main          PIC S9(5)V9(2).
       01  d_main          PIC S9(5)V9(2).
       01  result_main     PIC S9(5)V9(2).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).
       01 TEMP_4 PIC S9(9).
       01 TEMP_5 PIC S9(9).
       01 TEMP_6 PIC S9(9).
       01 TEMP_7 PIC S9(9).
       01 TEMP_8 PIC S9(9).
       01 TEMP_9 PIC S9(9).
       01 TEMP_10 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
      * float num = input.nextFloat();
      * int num = input.nextInt();
      * System.out.println(num);
      * type casting
       COMPUTE num_main = 56f
      * System.out.println(num);
      * automatic type promotion in expressions
      * int a = 257;
      * byte b = (byte)(a); // 257 % 256 = 1
      * byte a = 40;
      * byte b = 50;
      * byte c = 100;
      * int d = a * b / c;
      * 
      * System.out.println(d);
      * byte b = 50;
      * b = b * 2;
      * int number = 'A';
      * System.out.println("你好");
      * System.out.println(3 * 6);
       MOVE 42 TO b_main
       MOVE 'a' TO c_main
       MOVE 1024 TO s_main
       MOVE 50000 TO i_main
       COMPUTE TEMP_0 = f_main * b_main
       COMPUTE TEMP_1 = ORD / c_main
       COMPUTE TEMP_2 = FUNCTION + TEMP_1
       COMPUTE TEMP_3 = d_main * s_main
       COMPUTE TEMP_4 = TEMP_2 - TEMP_3
       COMPUTE result_main = TEMP_4
      * float + int - double = double
       COMPUTE TEMP_6 = f_main * b_main
       COMPUTE TEMP_5 = TEMP_6
       DISPLAY TEMP_5
       DISPLAY " "
       COMPUTE TEMP_8 = ORD / c_main
       COMPUTE TEMP_7 = TEMP_8
       DISPLAY TEMP_7
       DISPLAY " "
       COMPUTE TEMP_10 = d_main * s_main
       COMPUTE TEMP_9 = TEMP_10
       DISPLAY TEMP_9
       DISPLAY result_main
       EXIT.


