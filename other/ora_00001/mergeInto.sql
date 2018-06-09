merge into ora00001emp t1
    using ora00001emp2 t2
    on ( t1.job = t2.job)
when not matched then
    insert (t1.ename, t1.job) values ((select get_uuid from dual), t2.job);
