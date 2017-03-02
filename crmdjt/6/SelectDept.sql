create or replace procedure SelectDept(
    num_deptno in number,
    var_dname out dept.dname%type,
    var_loc out dept.loc%type) is
begin
    select dname, loc
    into var_dname, var_loc
    from dept
    where deptno = num_deptno;
exception
    when
        no_data_found
    then
        dbms_output.put_line('deptno error');
end SelectDept;
/
