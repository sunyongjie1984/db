select
    em2.ename, em1.ename
from
    emp em1
left join
    emp em2
on
    em1.mgr = em2.empno
order by
    em1.mgr;
