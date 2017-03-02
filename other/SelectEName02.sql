declare
    str varchar2(10);
    cursor c1
    is
    select ename from emp;
begin
    open c1;
    loop
        fetch c1 into str;
    exit when c1%NOTFOUND;
    dbms_output.put_line(str);
    end loop;
    close c1;
end;
/
