declare
month int:= 10;
begin
    if month>=0 and month <=3 then
        dbms_output.put_line('spring');
    elsif month >=4 and month <=6 then
        dbms_output.put_line('summer');
    elsif month >=7 and month <=9 then
        dbms_output.put_line('automn');
    elsif month >=10 and month <=12 then
        dbms_output.put_line('winter');
    else
        dbms_output.put_line('error');
    end if;
end;
/
