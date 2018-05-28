create or replace procedure ctab as

  i number;

begin

    execute immediate 'create table dd as

    select * from dept';

    execute immediate 'alter table dd add constraint pk_dd primary key(deptno)';



end;

