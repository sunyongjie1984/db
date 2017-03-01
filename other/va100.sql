VARIABLE ret_val NUMBER
BEGIN
    dbms_output.put_line('va100 begin');
    :ret_val := 0;
    dbms_output.put_line('va100 end');
END;
/

@va101.sql
PRINT ret_val
@va101.sql
PRINT ret_val
