declare
    var_dname dept.dname%type;
    var_loc dept.loc%type;
begin
    SelectDept(10, var_dname, var_loc);
    dbms_output.put_line(var_dname || ' locate: '||var_loc);
end;
/
