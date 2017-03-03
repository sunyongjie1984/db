select
    e.empno, e.ename, e.job, d.deptno, d.dname
from
    emp e
left join
    dept d
on
    e.deptno = d.deptno;
