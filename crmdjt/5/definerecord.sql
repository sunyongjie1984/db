declare
type emp_type is record
(
 var_ename varchar2(20),
 var_job varchar2(20),
 var_sal number);
empinfo emp_type;
begin
select ename,job,sal into empinfo from emp 
where empno = 7369;
dbms_output.put_line(empinfo.var_ename||empinfo.var_job||empinfo.var_sal);
end;
/
