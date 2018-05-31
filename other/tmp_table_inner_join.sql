select t1.empno, t1.ename, t1.sal, t1.deptno
from emp t1
inner join (
    select t2.deptno, max( t2.sal ) max_sal
    from emp t2
    group by t2.deptno ) t3
on ( t1.deptno = t3.deptno and t1.sal = t3.max_sal )


select t1.empno, t1.ename, t1.deptno, t1.sal
from emp t1
inner join (
    select t2.deptno, max(sal) max_sal
    from emp t2
    group by t2.deptno )
t3
on ( t1.deptno = t3.deptno and t1.sal = t3.max_sal )
order by t1.sal
