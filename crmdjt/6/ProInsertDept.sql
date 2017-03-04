create or replace procedure ProInsertDept is
begin
    insert into dept values(77, 'shi chang', 'jilin');
    commit;
    dbms_output.put_line('insert successfully');
end ProInsertDept;
/
