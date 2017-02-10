select
    d.field9021002 as Name,
    d.eai_template as Empno,
    -- max function
    -- min function
    min(d.field9021003) as InTime,
    max(d.field9021003) as OutTime
from
    XDJZ_EAI_INVOICE_DATA_9021 d
where
    (d.field9021003 between '2016-05-04 00:00:00' and '2016-05-04 23:59:59')
-- group by
group by
    d.field9021002, d.eai_template
-- order by name and time
order by
    Name, OutTime;
