       IDENTIFICATION DIVISION.
       PROGRAM-ID. clearLastIBits.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Method:clearLastIBits
           05  mask_clearLastIBits PIC S9(5).
           05  n_clearBitsInRange PIC S9(5).
           05  i_clearBitsInRange PIC S9(5).
           05  j_clearBitsInRange PIC S9(5).
