select * from emp
    where mgr = 7902
select count( * ) from emp;
select count( distinct mgr ) from emp;
-- the following statement can not run in file
-- I have to copy and paste this line in sqlplus window to run them
exec dbms_stats.gather_table_stats(ownname => 'SCOTT', tabname => 'EMP', estimate_percent => 100,
    cascade => true, method_opt =>'for all columns size 1', no_invalidate ->false);


--1.1.2.3
-- create t1 and t2

create table t1( c1 number, c2 varchar2( 10 ) );
create table t2( c1 number, c2 varchar2( 10 ) );

-- create index
create index idx_t2 on t2( c1 );

-- add some data
insert into t1 values( 40, 'haha' );
insert into t1 values( 14, 'ha8ha' );
insert into t1 values( 13, 'ha8ha' );
insert into t1 values( 12, 'haha' );
insert into t2 values( 11, 'haha' );
insert into t2 values( 30, 'haha' );
insert into t2 values( 40, 'haha' );
insert into t2 values( 50, 'haha' );
insert into t2 values( 60, 'haha' );
insert into t2 values( 70, 'haha' );

-- select
select t1.c1, t2.c2 from t1, t2
	where t1.c1 = t2.c1 and t1.c1 = 10;
select t1.c1, t2.c2 from t1, t2
	where t1.c1 = t2.c1 and t1.c1 = 10 and t2.c1 = 10
