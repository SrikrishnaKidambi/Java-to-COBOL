       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_Premium_MaximumPathSumInArray.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAXIMUMSUMPATH_CLASS_MAXIMUMPATHSUMINARRAY_GLOBAL
       01  INPUT1_MAXIMUMSUMPATH_-ARRAY.
           05  input1_maximumSumPath PIC S9(5) OCCURS 100 TIMES.
       01  INPUT2_MAXIMUMSUMPATH_-ARRAY.
           05  input2_maximumSumPath PIC S9(5) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAXIMUMSUMPATH_CLASS_MAXIMUMPATHSUMINARRAY_GLOBAL
       01  maxSum_maximumSumPath PIC S9(5).
       01  sum1_maximumSumPath PIC S9(5).
       01  sum2_maximumSumPath PIC S9(5).
       01  i_maximumSumPath PIC S9(5).
       01  j_maximumSumPath PIC S9(5).
      * Variables for Scope:METHOD_MAIN_CLASS_MAXIMUMPATHSUMINARRAY_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_MAXIMUMPATHSUMINARRAY_GLOBAL
       01  ARR1_MAIN_-ARRAY.
           05  arr1_main    PIC S9(5) OCCURS 100 TIMES.
       01  ARR2_MAIN_-ARRAY.
           05  arr2_main    PIC S9(5) OCCURS 100 TIMES.
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
       01 TEMP_11 PIC S9(9).
       01 TEMP_12 PIC S9(9).
       01 TEMP_13 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       maximumSumPath-PARA.
      * Your class should be named Solution
		* Don't write main().
		* Don't read input, they are passed as function arguments.
		* Return output and don't print it.
		* Taking input and printing output is handled automatically.
       MOVE 0 TO maxSum_maximumSumPath
       IF input1_maximumSumPath.length = 0  AND  input2_maximumSumPath.length = 0
      * in case both ararys are empty
       END-IF
       MOVE 0 TO sum1_maximumSumPath
       MOVE 0 TO sum2_maximumSumPath
       PERFORM UNTIL NOT (i_maximumSumPath < input1_maximumSumPath.length  AND  j_maximumSumPath < input2_maximumSumPath.length)
       IF input1_maximumSumPath[i_maximumSumPath] < input2_maximumSumPath[j_maximumSumPath]
       COMPUTE TEMP_0 = i_maximumSumPath + 1
       COMPUTE TEMP_1 = input1_maximumSumPath + TEMP_0
       COMPUTE sum1_maximumSumPath = TEMP_1
       ADD 1 TO i_maximumSumPath
       ELSE
       IF input2_maximumSumPath[j_maximumSumPath] < input1_maximumSumPath[i_maximumSumPath]
       COMPUTE TEMP_2 = j_maximumSumPath + 1
       COMPUTE TEMP_3 = input2_maximumSumPath + TEMP_2
       COMPUTE sum2_maximumSumPath = TEMP_3
       ADD 1 TO j_maximumSumPath
       ELSE
       IF input1_maximumSumPath[i_maximumSumPath] = input2_maximumSumPath[j_maximumSumPath]
      * intersection point
       COMPUTE TEMP_4 = i_maximumSumPath + 1
       COMPUTE TEMP_5 = input1_maximumSumPath + TEMP_4
       COMPUTE sum1_maximumSumPath = TEMP_5
       COMPUTE TEMP_6 = j_maximumSumPath + 1
       COMPUTE TEMP_7 = input2_maximumSumPath + TEMP_6
       COMPUTE sum2_maximumSumPath = TEMP_7
       COMPUTE TEMP_8 = sum1_maximumSumPath + sum2_maximumSumPath
       COMPUTE maxSum_maximumSumPath = TEMP_8
      * reinitialize both sums and start again
       MOVE 0 TO sum1_maximumSumPath
       MOVE 0 TO sum2_maximumSumPath
       ADD 1 TO i_maximumSumPath
       ADD 1 TO j_maximumSumPath
       END-IF
       END-IF
       END-IF
       END-PERFORM
      * System.out.println(i);
      * System.out.println(input1.length);
       PERFORM UNTIL NOT (i_maximumSumPath < input1_maximumSumPath.length)
      * in case there are still elements in 1st array
      * System.out.println(i);
       COMPUTE TEMP_9 = i_maximumSumPath + 1
       COMPUTE TEMP_10 = input1_maximumSumPath + TEMP_9
       COMPUTE sum1_maximumSumPath = TEMP_10
       ADD 1 TO i_maximumSumPath
       END-PERFORM
      * System.out.println(sum1);
       PERFORM UNTIL NOT (j_maximumSumPath < input2_maximumSumPath.length)
      * in case there are still elements in 1st array
       COMPUTE TEMP_11 = j_maximumSumPath + 1
       COMPUTE TEMP_12 = input2_maximumSumPath + TEMP_11
       COMPUTE sum2_maximumSumPath = TEMP_12
       ADD 1 TO j_maximumSumPath
       END-PERFORM
       COMPUTE TEMP_13 = sum1_maximumSumPath + sum2_maximumSumPath
       COMPUTE maxSum_maximumSumPath = TEMP_13
       EXIT.


       MAIN-PARA.
      * output 81
       DISPLAY maximumSumPath(arr1_main, arr2_main)
       EXIT.


