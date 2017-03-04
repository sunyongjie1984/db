declare
    sum_i int := 0;
    i     int := 0;
begin
    while i <= 99 loop
        i     := i + 1;
        sum_i := sum_i + i;
end loop;
    dbms_output.put_line(sum_i);
end;
/
