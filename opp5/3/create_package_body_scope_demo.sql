create or replace package body scope_demo
is
    procedure set_global(number_in in number)
    is
        l_salary number := 10000;
        l_count pls_integer;
    begin
        declare
            l_inner number;
        begin
            select count(*)
            into l_count
            from employees
            where department_id = l_inner and salary > l_salary;
        end local_block;

        g_global := number_in;
    end set_global;
end scope_demo;
