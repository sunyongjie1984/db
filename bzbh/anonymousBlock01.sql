declare
    b number;
begin
    select count(cust_id) into b
    from customers;
    dbms_output.put_line ( b );
end;
/
