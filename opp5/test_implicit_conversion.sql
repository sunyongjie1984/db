CREATE OR REPLACE PROCEDURE test_implicit_conversion (count_in IN PLS_INTEGER
                                                     )
IS
   c_pls_integer   CONSTANT PLS_INTEGER := 1;
   c_number        CONSTANT NUMBER := 1.0;
   l_number        NUMBER;
BEGIN
   sf_timer.start_timer;

   FOR indx IN 1 .. count_in
   LOOP
      l_number :=
           l_number
         + c_pls_integer
         + c_pls_integer
         + c_pls_integer
         + c_pls_integer
         + c_pls_integer
         + c_pls_integer;
   END LOOP;

   sf_timer.show_elapsed_time ('INTEGER + NUMBER');
   --
   sf_timer.start_timer;

   FOR indx IN 1 .. count_in
   LOOP
      l_number :=
           l_number
         + c_number
         + c_number
         + c_number
         + c_number
         + c_number
         + c_number;
   END LOOP;

   sf_timer.show_elapsed_time ('NUMBER + NUMBER');
END;
/

BEGIN
   test_implicit_conversion (10000000);
END;
/



/*======================================================================
| Supplement to the fifth edition of Oracle PL/SQL Programming by Steven
| Feuerstein with Bill Pribyl, Copyright (c) 1997-2009 O'Reilly Media, Inc. 
| To submit corrections or find more code samples visit
| http://oreilly.com/catalog/9780596514464/
*/
