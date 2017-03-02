declare
    usr_excp exception;
    usr_excp_num number := -20101;
    usr_excp_str varchar2(30) := 'User Exception';
    pragma exception_init(usr_excp, -20101);
begin
    dbms_output.put_line('1---');
    raise_application_error(usr_excp_num, usr_excp_str);
    dbms_output.put_line('2---');
exception
    when usr_excp then
        dbms_output.put_line(SQLCODE);
        dbms_output.put_line(SQLERRM);
    when others then
        dbms_output.put_line('Error');
end;
/
