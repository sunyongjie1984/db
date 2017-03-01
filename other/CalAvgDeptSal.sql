create or replace procedure CalAvgDeptSal
as
begin
    for record in ( select deptno, round(avg(sal), 2) as AvgSal from emp group by deptno )
        loop
            insert into NewAvgSal
            values
            ( sysdate, record.deptno, record.AvgSal );
            commit;
        end loop;
    end;
