/* From the "Is Fixed-Length Really Fixed?" sidebar.
   Note! To match the sidebar output, you MUST run
   this example on a system using UTF-8 as the
   database character set. */
DECLARE
   x CHAR(3);
BEGIN
   --Assign a single-byte character
   x := 'a';
   DBMS_OUTPUT.PUT_LINE(LENGTHB(x));

   --and now a two-byte character
   x := '�';
   DBMS_OUTPUT.PUT_LINE(LENGTHB(x));

   --and now two characters for a total
   --of three bytes
   x := '�a';
   DBMS_OUTPUT.PUT_LINE(LENGTHB(x));
END;
/




/*======================================================================
| Supplement to the fifth edition of Oracle PL/SQL Programming by Steven
| Feuerstein with Bill Pribyl, Copyright (c) 1997-2009 O'Reilly Media, Inc. 
| To submit corrections or find more code samples visit
| http://oreilly.com/catalog/9780596514464/
*/
