select sysdate Insert_Date, f.l_fundid, f.vc_code, f.vc_name, sum(v.en_debit) Management_Cost, v.l_month, v.l_year
from tfundinfo f, tvouchers v
where f.l_fundid = v.l_fundid
and v.vc_code like '640301'
and v.l_fundid in (6030, 5130)
-- and v.l_month = 9
group by f.vc_code, f.vc_name, f.l_fundid, v.l_month, v.l_year
order by f.l_fundid, v.l_month
/
