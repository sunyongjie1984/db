create or replace procedure ProGetSalMoreThanAvg is
varempno emp.empno%type;
varename emp.ename%type;
varsal emp.sal%type;
varavgsal emp.sal%type;
vardeptno emp.deptno%type;
cursor c1 is
select t1.empno, t1.ename, t1.sal, t2.AvgSal, t1.deptno
into varempno, varename, varsal, varavgsal, vardeptno
from emp t1,
(select deptno, avg(sal) AvgSal from emp group by deptno) t2
where
t1.deptno = t2.deptno
and
T1.sal > t2.AvgSal
order by t1.deptno;
begin
    open c1;
    loop
        fetch c1 into varempno, varename, varsal, varavgsal, vardeptno;
        exit when c1%notfound;
    dbms_output.put_line(to_char(varempno) || ' ' || varename || ' ' || to_char(varsal) || ' ' || to_char(varavgsal) || ' ' || to_char(vardeptno));
    end loop;
    close c1;
end;
/
