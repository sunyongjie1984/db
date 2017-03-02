create or replace function GetAvgPay(num_deptno number) return number is num_avg_pay number;
begin
    select avg(sal) into num_avg_pay from emp
    where deptno = num_deptno;
    return (round(num_avg_pay, 2));
exception
    when no_data_found
    then dbms_output.put_line('deptno error');
    return (0);
end;
/
