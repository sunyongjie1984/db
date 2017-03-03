select e.empno, e.ename, d.dname, e.deptno, d.deptno
from emp e, dept d
where e.deptno = d.deptno
and e.job = 'MANAGER';

/**
EMPNO ENAME      DNAME              DEPTNO     DEPTNO---------------------------------
----- ---------- -------------- ---------- -------------------------------------------
 7782 CLARK      ACCOUNTING             10         10---------------------------------
 7566 JONES      RESEARCH               20         20---------------------------------
 7698 BLAKE      SALES                  30         30----------
**/
