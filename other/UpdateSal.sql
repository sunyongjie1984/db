declare
v_sal_increase emp.sal%type := 200;
begin
    update emp
    set sal = sal + v_sal_increase
    where empno = 1;
end;
/
