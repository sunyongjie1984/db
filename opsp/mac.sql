declare
   l_in_val varchar2(2000) := 'CriticalData';
   l_key    varchar2(2000) := '1234567890123456';
   l_mac    raw(2000);
begin
   l_mac := dbms_crypto.mac (
      src => UTL_I18N.STRING_TO_RAW (l_in_val, 'AL32UTF8'),
      typ => dbms_crypto.hmac_sh1,
      key => UTL_I18N.STRING_TO_RAW (l_key, 'AL32UTF8')
   );
   dbms_output.put_line('MAC='||l_mac);
end;



/*======================================================================
| Supplement to the fifth edition of Oracle PL/SQL Programming by Steven
| Feuerstein with Bill Pribyl, Copyright (c) 1997-2009 O'Reilly Media, Inc. 
| To submit corrections or find more code samples visit
| http://oreilly.com/catalog/9780596514464/
*/