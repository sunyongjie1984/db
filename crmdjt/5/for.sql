declare
    sum_i int := 0;
    -- i     int := 0;
begin
    for i in reverse 1..100 loop
        if mod(i, 2) = 0 then
        sum_i := sum_i + i;
        end if;
    end loop;
    dbms_output.put_line(sum_i);
end;
/
