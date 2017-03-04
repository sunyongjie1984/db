DECLARE
   SUBTYPE DATE IS NUMBER;
   VARCHAR2 DATE := 11111;
   NO_DATA_FOUND EXCEPTION;
   TO_CHAR       PLS_INTEGER;
BEGIN
   DBMS_OUTPUT.put_line (VARCHAR2);

   SELECT 1
     INTO TO_CHAR
     FROM sys.DUAL
    WHERE 1 = 2;
EXCEPTION
   WHEN NO_DATA_FOUND
   THEN
      DBMS_OUTPUT.put_line ('Trapped!');
END;
/



/*======================================================================
| Supplement to the fifth edition of Oracle PL/SQL Programming by Steven
| Feuerstein with Bill Pribyl, Copyright (c) 1997-2009 O'Reilly Media, Inc. 
| To submit corrections or find more code samples visit
| http://oreilly.com/catalog/9780596514464/
*/
