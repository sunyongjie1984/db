select empno, ename, sal, deptno from emp where sal > (select avg(sal) from emp emp2 where emp.deptno = emp2.deptno);

select deptno, avg(sal) from emp group by deptno;
select empno, deptno, avg(sal) from emp group by deptno, empno;


select job, deptno, avg(sal) from emp group by deptno, job;
