select t1.empno, t1.ename, t1.deptno
    from emp t1
    inner join (
        select t2.deptno, max( t2.sal ) max_sal
        from emp t2
        group by t2.deptno ) t2
    on ( t1.deptno = t2.deptno and t1.sal = t2.max_sal )
