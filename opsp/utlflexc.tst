begin
   raise utl_file.invalid_&&firstparm;
exception
when others then p.l(sqlcode); p.l(sqlerrm);
end;



/*======================================================================
| Supplement to the fifth edition of Oracle PL/SQL Programming by Steven
| Feuerstein with Bill Pribyl, Copyright (c) 1997-2009 O'Reilly Media, Inc. 
| To submit corrections or find more code samples visit
| http://oreilly.com/catalog/9780596514464/
*/
