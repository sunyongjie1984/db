-- emp3 created before
-- this sql
declare
begin
    delete from emp3;
    insert into emp3
    (
        select * from emp
    );
end;
/
