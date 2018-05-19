create table emp_temp as select * from emp;
create index idx_mgr_temp on emp_temp(mgr);
create index idx_deptno_temp on emp_temp(deptno);
select * from emp_temp where mgr > 100 and deptno > 100;
alter session set optimizer_mode = 'RULE';
set autotrace traceonly explain;
select * from emp_temp where mgr > 100 and deptno + 0 > 100;
create table emp_temp1 as select * from emp;
select t1.mgr, t2.deptno
    from emp_temp1 t2, emp_temp t1
    where t1.empno = t2.empno;
select t1.mgr, t2.deptno
    from emp t1, emp_temp t2
    where t1.empno = t2.empno;
select t1.mgr, t2.deptno
    from emp_temp t2, emp t1
    where t1.empno = t2.empno;
