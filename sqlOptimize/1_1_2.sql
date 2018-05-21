select * from emp
    where mgr = 7902
select count( * ) from emp;
select count( distinct mgr ) from emp;
// the following statement can not run in file
// I have to copy and paste this line in sqlplus window to run them
exec dbms_stats.gather_table_stats(ownname => 'SCOTT', tabname => 'EMP', estimate_percent => 100,
    cascade => true, method_opt =>'for all columns size 1', no_invalidate ->false);
