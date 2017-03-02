declare
    v_empno emp.empno%type;
begin
    select empno_sequence.NEXTVAL
        into v_empno
        from dual;
    insert into emp(empno, ename, job, deptno)
    values(v_empno, 'harding', 'clerk', 10);
end;
/
