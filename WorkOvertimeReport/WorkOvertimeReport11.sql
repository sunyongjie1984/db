select
    d.field9021002 as Name,
    d.eai_template as Empno,
-- no max for day
    substr(d.field9021003, 1, 10) as day,
-- max function
-- min function
    min(d.field9021003) as InTime,
    max(d.field9021003) as OutTime
from
    XDJZ_EAI_INVOICE_DATA_9021 d
where
    (d.field9021003 between '2016-05-05 00:00:00' and '2016-05-05 23:59:59')
-- group by
group by
-- group by the last one is wrong, see the WorkOvertimeReport12.sql
    d.field9021002, d.eai_template, d.field9021003
-- order by name and time
order by
    Name, OutTime;
