select t1.empno, t1.ename, t1.deptno
	from emp t1
	inner join dept t2
	on (t1.empno = 7844 )
select t1.empno, t1.ename, t1.deptno, t2.dname
	from emp t1
	inner join dept t2
	on (t1.empno = 7844 )

select t1.empno, t1.ename, t2.dname
 	from emp t1
 	inner join dept t2
 	on ( t1.deptno = t2.deptno or t2.deptno = 20)

select t1.empno, t1.ename, t1.deptno, t2.dname
	from emp t1
	inner join dept t2
	-- on (t1.empno = 7844 and t1.deptno = t2.deptno)
	on (t1.empno = 7844 )

-------------- why table access full
select t1.ename, t1.deptno, t2.dname
    from emp t1
    inner join dept t2
    on t1.deptno = t2.deptno

-- force using index
select /*+ index(t2 pk_dept ) */ t1.ename, t1.deptno, t2.dname
    from emp t1
    inner join dept t2
    on t1.deptno = t2.deptno

select t1.empno, t1.ename, t1.deptno, t2.dname
    from emp t1
    inner join dept t2
    on t1.deptno = t2.deptno

select t1.empno, t1.ename, t1.deptno
    from emp t1
    inner join dept t2
    on t1.deptno = t2.deptno

select t1.dname, t1.deptno, t2.ename
    from dept t1
    inner join emp t2
    on t1.deptno = t2.deptno

select t1.empno, t1.ename, t1.deptno, t2.dname
    from emp t1
    inner join dept t2
    on ( t1.deptno = t2.deptno and t1.empno = 7900 )

-- force using access full scan

select deptno from dept
