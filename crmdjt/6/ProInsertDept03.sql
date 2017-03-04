create or replace procedure ProInsertDept03(
   deptno in number,
    dname in varchar2 ,
   dloc in varchar2 )
is

begin
    insert into dept values(deptno,dname,dloc);
    commit;
    dbms_output.put_line('insert successfully');
exception
    when no_data_found then
        dbms_output.put_line('insert successfully');

end ProInsertDept03;
/
