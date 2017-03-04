declare
    avg_pay number;
begin
    avg_pay := FuncGetAvgPay(10);
    dbms_output.put_line(avg_pay);
end;
/
