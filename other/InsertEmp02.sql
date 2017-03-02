declare
    -- emp empno number(4)
begin
    -- will take effect
    insert into emp(empno, ename)
    values(1001, 'Ichiro');

    -- will cause exception
    insert into emp(empno, ename)
    values(10010, 'Ichiro*10');

    -- the following will not run
    insert into emp(empno, ename)
    values(1002, 'Ichiro+1');
exception
    when dup_val_on_index
    then
    dbms_output.put_line(SQLCODE);
    dbms_output.put_line(SQLERRM);

    dbms_output.put_line('dup_val_on_index');
    when others
    then
    dbms_output.put_line('Error');
end;
/
