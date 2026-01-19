       IDENTIFICATION DIVISION.
       PROGRAM-ID. java-dsa-bootcamp_Q19.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_Q19_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_Q19_GLOBAL
       01  in_main         PIC X(100).
       01  r_main          PIC S9(5)V9(2).
       01  h_main          PIC S9(5)V9(2).
       01  curvedSurfaceArea_main PIC S9(5)V9(2).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Curved Surface Area of cube
      * Input from ODT is enabled
      * System.out.println("Enter the side of the cube");
      * double side = in.nextDouble();
      * double curvedSurfaceArea = 6*side*side;
      * System.out.println("The total surface area of the cube is " + curvedSurfaceArea);
      * Q19 is to find Curved Surface Area Of Cylinde
       DISPLAY "Enter the radius of the cylinder"
       ACCEPT r_main
       DISPLAY "Enter the height of the cylinder"
       ACCEPT h_main
       COMPUTE TEMP_0 = Math * PI
       COMPUTE TEMP_1 = TEMP_0 * r_main
       COMPUTE TEMP_2 = TEMP_1 * h_main
       COMPUTE curvedSurfaceArea_main = TEMP_2
       DISPLAY "Curved Surface Area Of Cylinder is "
       DISPLAY curvedSurfaceArea_main
       EXIT.


