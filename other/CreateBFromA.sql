-- not work
-- still don't know why
declare
begin
    create table empc
    as
    select * from emp;
end;
/
