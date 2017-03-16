select f.l_fundid, f.vc_code, f.vc_name, sum(v.en_debit) Management_Cost, v.l_month, v.l_year, v.d_date
from tfundinfo f, tvouchers v
where f.l_fundid = v.l_fundid
and v.vc_code like '640301'
and v.l_fundid = 6030
and v.l_month = 12
group by f.vc_code, f.vc_name, f.l_fundid, v.l_month, v.l_year, v.d_date
order by v.l_month
/
