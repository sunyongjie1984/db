-- set serveroutput on;
declare
a number := 100;
begin
    -- only shows data if you execute on sqlplus command:
    -- serveroutput on
    dbms_output.put_line('Hello World');
    dbms_output.put_line(to_char(a)); -- number variable
    dbms_output.put_line(to_char(sysdate)); -- date variable

    -- Use || for concatenation:
    dbms_output.put_line('Value of a:' || to_char(a));
    -- Shows current date including seconds:
    dbms_output.put_line(to_char(sysdate, 'dd-mon-yy hh:mi:ss'));
end;
/
