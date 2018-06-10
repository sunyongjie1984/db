drop table dd1;
create table dd1
(
    id VARCHAR2(50) primary key,
    JOB VARCHAR2(9),
    sal number(10)
);
drop table dd2;
create table dd2
(
    id VARCHAR2(50) primary key,
    JOB VARCHAR2(9),
    sal number(10)
);
insert into dd1  values('syj', 'engineer',  2000);
insert into dd2 values('syj', 'engineer',  3000);
insert into dd2 values('wj',  'engineer2', 4000);
insert into dd2 values('lgx',  'engineer2', 5000);
