CREATE OR REPLACE FUNCTION updnval (
   col        IN   VARCHAR2
 , val        IN   NUMBER
 , start_in   IN   DATE
 , end_in     IN   DATE
)
   RETURN PLS_INTEGER
IS
BEGIN
   EXECUTE IMMEDIATE    'UPDATE employee SET '
                     || col
                     || ' = :the_value 
        WHERE hire_date BETWEEN :lo AND :hi'
               USING val, start_in, end_in;

   RETURN SQL%ROWCOUNT;
END;
/



/*======================================================================
| Supplement to the fifth edition of Oracle PL/SQL Programming by Steven
| Feuerstein with Bill Pribyl, Copyright (c) 1997-2009 O'Reilly Media, Inc. 
| To submit corrections or find more code samples visit
| http://oreilly.com/catalog/9780596514464/
*/
