select d.field9021002 as Name,
d.eai_template as Empno,
d.field9021003 as OutTime
from XDJZ_EAI_INVOICE_DATA_9021 d
where (d.field9021003 between '2016-05-04 00:00:00' and '2016-05-04 23:59:59')
-- order only by time
order by OutTime;
