
select t1.col1, t1.col2, t2.col3
	from t1
	full outer join t2
	on ( t1.col2 = t2.col2 )

select * from t1;
