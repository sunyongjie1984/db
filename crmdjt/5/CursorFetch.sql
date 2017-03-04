declare
cursor cur_emp(var_job in varchar2:='SALESMAN')  --游标是有参数的
    is
        select empno,ename,sal
        from emp
        where job = var_job;

type record_emp is record(
    var_empno emp.empno%type,
    var_ename emp.ename%type,
    var_sal emp.sal%type);

emp_row record_emp;

begin
    open cur_emp('MANAGER');
    fetch cur_emp into emp_row;

    while cur_emp%found loop
        dbms_output.put_line(emp_row.var_empno||'  '||emp_row.var_ename||'   '||emp_row.var_sal);
        fetch cur_emp into emp_row;
    end loop;

    close cur_emp;
end;
/
