select dept_name,
name,
Empno,
day,
out_time2,
week,
hours,
case
when week in ('星期六', '星期日') then
    floor(hours / 4) * 30
else
    30
end as amount
from (select name,
    Empno,
    dept_name,
    day,
    substr(out_time, -8) as out_time2,
    week,
    round(to_number(to_date(out_time, 'yyyy-mm-dd hh24:mi:ss') -
            to_date(in_time, 'yyyy-mm-dd hh24:mi:ss')) * 24) as hours
    from (select max(d.field9021002) as name,
        d.eai_template as Empno,
        max(p.department_name) as dept_name,
        substr(d.field9021003, 1, 10) as day,
        min(d.field9021003) as in_time,
        max(d.field9021003) as out_time,
        max(to_char(to_date(field9021003,
                    'yyyy-mm-dd hh24:mi:ss'),
                'day','NLS_DATE_LANGUAGE = ''SIMPLIFIED CHINESE''')) as week
        from XDJZ_EAI_INVOICE_DATA_9021 d, xdjz_eai_hr_person p
        where d.field9021003 between '2016-05-01 00:00:00' and
        '2016-05-24 23:59:59'
        and p.job_number = d.eai_template
        group by d.eai_template, substr(d.field9021003, 1, 10)
    )
    where (substr(out_time, -8) > '18:30:00' and
        week not in ('星期六', '星期日'))
    or week in ('星期六', '星期日'))
where hours > 0
order by dept_name, Empno, day;
