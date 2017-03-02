declare
v_sum_sal emp.sal%type;
v_deptno number not null := 10;
begin
    select sum(sal) -- group function
    into v_sum_sal
    from emp
    where deptno = v_deptno;
    dbms_output.put_line('sum(sal) of deptno 10 is '|| to_char(v_sum_sal));
end;
/
