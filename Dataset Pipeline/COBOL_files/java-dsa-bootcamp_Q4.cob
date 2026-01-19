       IDENTIFICATION DIVISION.
       PROGRAM-ID. java-dsa-bootcamp_Q4.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_Q4_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_Q4_GLOBAL
       01  sc_main         PIC X(100).
       01  price_main      PIC S9(5)V9(2).
       01  discount_main   PIC S9(5)V9(2).
       01  total_main      PIC S9(5)V9(2).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Calculate Discount Of Product
      * Input from ODT is enabled
       DISPLAY "Enter The Price Of Product"
       ACCEPT price_main
       MOVE 0 TO discount_main
       IF price_main > 1000
       COMPUTE TEMP_0 = 0 * 1
       COMPUTE discount_main = TEMP_0
       ELSE
       IF price_main > 500
       COMPUTE TEMP_1 = 0 * 2
       COMPUTE discount_main = TEMP_1
       ELSE
       COMPUTE TEMP_2 = 0 * 3
       COMPUTE discount_main = TEMP_2
       END-IF
       END-IF
       SUBTRACT discount_main FROM price_main GIVING total_main
       DISPLAY "Total Price Of Product Is "
       DISPLAY total_main
       DISPLAY "Discount Of Product Is "
       DISPLAY discount_main
       EXIT.


