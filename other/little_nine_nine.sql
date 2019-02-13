--Ð¡¾Å¾Å
with x1 as
 (select level lv from dual connect by level <= 9),
x2 as
 (select a.lv left,
         b.lv right,
         b.lv || '*' || a.lv || '=' || a.lv * b.lv text
    from x1 a, x1 b
   where b.lv <= a.lv)
select left, listagg(text, ',') within group(order by text) texts
  from x2
 group by
  left;
