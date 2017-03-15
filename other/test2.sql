select distinct f.l_fundid, f.vc_code,f.vc_name, sum(v.en_debit)
  from tfundinfo f, tvouchers v
 where /*v.l_fundid = 8021
   and*/ f.l_fundid = v.l_fundid
   and v.vc_code like '640301'
   group by f.l_fundid,f.vc_code,f.vc_name

