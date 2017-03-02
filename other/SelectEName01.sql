declare
    str varchar2(10);
begin
    -- ORA-01422: exact fetch returns more than requested number of rows
    select ename into str from emp;
end;
/
