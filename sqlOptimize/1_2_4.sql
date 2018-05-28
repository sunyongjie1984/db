create table t1( col1 number, col2 varchar2( 1 ) )
create table t2( col2 varchar2( 1 ), col3 varchar2( 2 ) )
insert into t1 values( 1, 'A' )
insert into t1 values( 2, 'B' )
insert into t1 values( 3, 'C' )
insert into t2 values( 'A', 'A2' )
insert into t2 values( 'B', 'B2' )
insert into t2 values( 'D', 'D2' )

-- inner join
select t1.col1, t1.col2, t2.col3
	from t1, t2
	where t1.col2 = t2.col2

select t1.col1, t1.col2, t2.col3
	from t1
	inner join t2
	on ( t1.col2 = t2.col3 )

-- left outer join
select t1.col1, t1.col2, t2.col3
	from t1
	left outer join t2
	on ( t1.col2 = t2.col2 )
-- right outer join
select t1.col1, t1.col2, t2.col3
	from t1
	right outer join t2
	on ( t1.col2 = t2.col2 )
-- full outer join
select t1.col1, t1.col2, t2.col3
	from t1
	full outer join t2
	on ( t1.col2 = t2.col2 )
