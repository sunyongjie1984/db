select max(d.field9021002) as name,
d.eai_template as Empno,
max(p.department_name) as dept_name,
substr(d.field9021003, 1, 10) as day,
min(d.field9021003) as in_time,
max(d.field9021003) as out_time,
max(to_char(to_date(field9021003,
            'yyyy-mm-dd hh24:mi:ss'),
        'day')) as week
from XDJZ_EAI_INVOICE_DATA_9021 d, xdjz_eai_hr_person p
where d.field9021003 between '2016-05-01 00:00:00' and
'2016-05-24 23:59:59'
and p.job_number = d.eai_template
group by d.eai_template, substr(d.field9021003, 1, 10);
