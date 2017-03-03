-- select deptno, avg(sal) from emp group by deptno;

-- select empno, ename,sal, deptno
-- from emp e1
-- where sal >
-- (
--     select avg(sal) from emp e2 where e1.deptno = e2.deptno
-- )
-- order by deptno;

-- select e.empno, e.ename, e.deptno from emp e, dept d where e.deptno = d.deptno;

select t1.empno, t1.ename, t1.sal, t2.AvgSal, t1.deptno
from emp t1,
(select deptno, avg(sal) AvgSal from emp group by deptno) t2
where
t1.deptno = t2.deptno
and
T1.sal > t2.AvgSal
order by t1.deptno;
