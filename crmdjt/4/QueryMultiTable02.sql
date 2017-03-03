select
    e.empno, e.ename, d.dname, e.deptno e_deptno, d.deptno d_deptno
from
    emp e
inner join
    dept d
on
    e.deptno = d.deptno
-- and
--     e.job = 'MANAGER';
