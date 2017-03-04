declare
    num_deptno emp.deptno%type;
    var_job emp.job%type;
    num_avg_sal emp.sal%type;
    num_proportion number;
begin
    num_deptno :=10;
    num_avg_sal := pack_emp.fun_avg_sal(num_deptno);
    dbms_output.put_line(num_deptno||' department sal is '||num_avg_sal);

    var_job := 'SALESMEN';
    num_proportion := 0.1;
    pack_emp.pro_regulate_sal(var_job,num_proportion);
end;
/
