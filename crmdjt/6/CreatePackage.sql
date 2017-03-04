create or replace package pack_emp is
function fun_avg_sal(num_deptno number) return number;
procedure pro_regulate_sal(var_job varchar2,num_proportion number);

end pack_emp;
/
