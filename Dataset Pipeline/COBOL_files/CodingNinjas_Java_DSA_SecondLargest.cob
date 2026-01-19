       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_SecondLargest.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_SECONDLARGESTELEMENT_CLASS_SECONDLARGEST_GLOBAL
       01  ARR_SECONDLARGESTELEMENT_-ARRAY.
           05  arr_secondLargestElement PIC S9(5) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_SECONDLARGESTELEMENT_CLASS_SECONDLARGEST_GLOBAL
       01  first_secondLargestElement PIC S9(5).
       01  second_secondLargestElement PIC S9(5).
      * Variables for Scope:BLOCK_IF_BLOCK_METHOD_SECONDLARGESTELEMENT_CLASS_SECONDLARGEST_GLOBAL
       01  check_secondLargestElement PIC X(1).
      * Variables for Scope:FOR_BLOCK_IF_BLOCK_METHOD_SECONDLARGESTELEMENT_CLASS_SECONDLARGEST_GLOBAL
       01  i_secondLargestElement PIC S9(5).
      * Variables for Scope:FOR_BLOCK_IF_BLOCK_IF_BLOCK_METHOD_SECONDLARGESTELEMENT_CLASS_SECONDLARGEST_GLOBAL
       01  i_secondLargestElement PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       secondLargestElement-PARA.
      * Your code goes here
       IF arr_secondLargestElement.length <= 1
      * System.out.println("Array size <= 1");
       ELSE
       MOVE 'Y' TO check_secondLargestElement
       PERFORM VARYING i_secondLargestElement FROM 1 BY 1 UNTIL NOT (i_secondLargestElement < arr_secondLargestElement.length)
       IF arr_secondLargestElement[0] != arr_secondLargestElement[i_secondLargestElement]
       MOVE 'N' TO check_secondLargestElement
       EXIT PERFORM
       END-IF
       END-PERFORM
       IF check_secondLargestElement = true
      * System.out.println("All elements are equal");
       ELSE
       PERFORM VARYING i_secondLargestElement FROM 0 BY 1 UNTIL NOT (i_secondLargestElement < arr_secondLargestElement.length)
       IF arr_secondLargestElement[i_secondLargestElement] > first_secondLargestElement
       MOVE first_secondLargestElement TO second_secondLargestElement
       MOVE arr_secondLargestElement(i_secondLargestElement + 1) TO first_secondLargestElement
       ELSE
       IF arr_secondLargestElement[i_secondLargestElement] > second_secondLargestElement  AND  arr_secondLargestElement[i_secondLargestElement] != first_secondLargestElement
       MOVE arr_secondLargestElement(i_secondLargestElement + 1) TO second_secondLargestElement
       END-IF
       END-IF
       END-PERFORM
       END-IF
       END-IF
       EXIT.


