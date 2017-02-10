select
    t.Name,
    t.DeptName,
    t.Empno,
    t.day,
    t.InTime,
    t.OutTime,
    t.week,
    round(to_number(to_date(OutTime, 'yyyy-mm-dd hh24:mi:ss')
        - to_date(InTime, 'yyyy-mm-dd hh24:mi:ss')) * 24) as hours
from
(
    select
        d.field9021002 as Name,
        -- add DeptName
        p.department_name as DeptName,
        d.eai_template as Empno,
        -- no max for day
        substr(d.field9021003, 1, 10) as day,
        -- max function
        -- min function
        min(d.field9021003) as InTime,
        max(d.field9021003) as OutTime,
        -- add week
        max(to_char(to_date(field9021003, 'yyyy-mm-dd hh24:mi:ss'), 'day')) as week
    from
        XDJZ_EAI_INVOICE_DATA_9021 d ,xdjz_eai_hr_person p
    where
        (d.field9021003 between '2016-05-04 00:00:00' and '2016-05-05 23:59:59')
        and
        -- and Empno should not be null
        (d.eai_template != 'NULL')
        and
        -- two table empno should be the same
        (d.eai_template = p.job_number)
    -- group by
    group by
        -- add DeptName
        d.field9021002, d.eai_template, p.department_name, substr(d.field9021003, 1, 10)
    -- order by name and time
    order by
        -- first by people, second by outtime
        Empno, OutTime
) t
where
    -- after 18:30, counts
    (substr(OutTime, -8) > '18:30:00');
