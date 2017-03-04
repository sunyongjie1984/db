declare
 var_name1 varchar2(50);
 var_name2 varchar2(50);
begin
    var_name1:='East';
    var_name2:='Xiaoke';
    if length(var_name1)<length(var_name2) then
        dbms_output.put_line(var_name1||'is not longer then '||var_name2);
    end if;
end;
/
