create or replace package body pack_emp 
is 

function fun_avg_sal(num_deptno number) return number is 
num_avg_sal number;
begin
    select round(avg(sal),2) into num_avg_sal 
    from emp
    where deptno = num_deptno;
    return (num_avg_sal);
exception
when no_data_found then
    dbms_output.put_line('no department');
    return (0);
end fun_avg_sal;

procedure pro_regulate_sal(var_job varchar2,num_proportion number) is
begin
    update emp 
    set sal = sal*(1+num_proportion)
    where job = var_job;
end pro_regulate_sal;

end pack_emp;
/

