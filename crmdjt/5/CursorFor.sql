declare
    cursor cur_emp is
    select * from emp
    where deptno = 30;

begin
    for emp_record in cur_emp
    loop
        dbms_output.put('empno: ' || emp_record.empno);
        dbms_output.put('; empname: ' || emp_record.ename);
        dbms_output.put_line('; job: ' || emp_record.job);
    end loop;
end;
/
