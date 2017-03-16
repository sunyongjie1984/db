select f.l_fundid, f.vc_code,f.vc_name, sum(v.en_debit) Management_Cost
from tfundinfo f, tvouchers v
where f.l_fundid = v.l_fundid
and v.vc_code like '640301'
group by f.l_fundid,f.vc_code,f.vc_name
/
