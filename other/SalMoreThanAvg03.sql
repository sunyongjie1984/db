-- select deptno, avg(sal) from emp group by deptno;

-- select empno, ename,sal, deptno
-- from emp e1
-- where sal >
-- (
--     select avg(sal) from emp e2 where e1.deptno = e2.deptno
-- )
-- order by deptno;

-- select e.empno, e.ename, e.deptno from emp e, dept d where e.deptno = d.deptno;

select t1.*, t2.AvgSal from emp t1, (select deptno, avg(sal) AvgSal from emp group by deptno) t2 where t1.deptno = t2.deptno;
