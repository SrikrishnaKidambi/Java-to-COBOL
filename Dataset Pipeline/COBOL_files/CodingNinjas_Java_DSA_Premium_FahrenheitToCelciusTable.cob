       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_Premium_FahrenheitToCelciusTable.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_PRINTFAHRENHEITTABLE_CLASS_SOLUTION_CLASS_FAHRENHEITTOCELCIUSTABLE_GLOBAL
       01  start_printFahrenheitTable PIC S9(5).
       01  end_printFahrenheitTable PIC S9(5).
       01  step_printFahrenheitTable PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_PRINTFAHRENHEITTABLE_CLASS_SOLUTION_CLASS_FAHRENHEITTOCELCIUSTABLE_GLOBAL
       01  fahrenheight_printFahrenheitTable PIC S9(5).
      * Variables for Scope:BLOCK_FOR_BLOCK_METHOD_PRINTFAHRENHEITTABLE_CLASS_SOLUTION_CLASS_FAHRENHEITTOCELCIUSTABLE_GLOBAL
       01  celcius_printFahrenheitTable PIC S9(5).
      * Variables for Scope:METHOD_MAIN_CLASS_FAHRENHEITTOCELCIUSTABLE_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_FAHRENHEITTOCELCIUSTABLE_GLOBAL
       01  s_main          PIC X(100).
       01  start_main      PIC S9(5).
       01  end_main        PIC S9(5).
       01  step_main       PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       printFahrenheitTable-PARA.
      * Your class should be named Solution 
			 * Don't write main(). 
			 * Don't read input, it is passed as function argument. 
			 * Print the specified output in required format. 
			 * Taking input is handled automatically.
       PERFORM VARYING fahrenheight_printFahrenheitTable FROM start_printFahrenheitTable BY 1 UNTIL NOT (fahrenheight_printFahrenheitTable <= end_printFahrenheitTable)
       COMPUTE TEMP_0 = 0 / 9
       COMPUTE TEMP_1 = fahrenheight_printFahrenheitTable - 32
       COMPUTE TEMP_2 = TEMP_0 * TEMP_1
       COMPUTE celcius_printFahrenheitTable = TEMP_2
       DISPLAY fahrenheight_printFahrenheitTable
       DISPLAY "\t"
       DISPLAY celcius_printFahrenheitTable
       END-PERFORM
       EXIT.


       MAIN-PARA.
      * TODO Auto-generated method stub
      * Input from ODT is enabled
       ACCEPT start_main
       ACCEPT end_main
       ACCEPT step_main
       EXIT.


