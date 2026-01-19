       IDENTIFICATION DIVISION.
       PROGRAM-ID. Java-DSA-Bootcamp_ArrayListExample.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_ARRAYLISTEXAMPLE_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_ARRAYLISTEXAMPLE_GLOBAL
       01  in_main         PIC X(100).
       01  list_main       PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_ARRAYLISTEXAMPLE_GLOBAL
       01  i_main          PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
      * Syntax
      * list.add(67);
      * list.add(234);
      * list.add(654);
      * list.add(43);
      * list.add(654);
      * list.add(8765);
      * System.out.println(list.contains(765432));
      * System.out.println(list);
      * list.set(0, 99);
      * 
      * list.remove(2);
      * 
      * System.out.println(list);
      * input
       PERFORM VARYING i_main FROM 0 BY 1 UNTIL NOT (i_main < 5)
       END-PERFORM
      * get item at any index
       PERFORM VARYING i_main FROM 0 BY 1 UNTIL NOT (i_main < 5)
      * pass index here, list[index] syntax will not work here
       DISPLAY list_main.get(i_main)
       END-PERFORM
       DISPLAY list_main
       EXIT.


