declare
myrowtype emp%rowtype;
begin
    select * into myrowtype from emp where empno = 7369;
    dbms_output.put_line(myrowtype.empno||'  '||myrowtype.ename||'   '||myrowtype.sal);
end;
/
