merge into dd1 t1
    using dd2 t2
    on ( t1.job = t2.job )
when matched then
    update set
    t1.sal = t2.sal
when not matched then
    -- will error out, get_uuid only run once
    -- insert ( t1.id, t1.job, t1.sal ) values ( ( select get_uuid from dual ), t2.job, t2.sal );

    -- will not error out, get_uuid runs as many times as insert
    insert ( t1.id, t1.job, t1.sal ) values ( get_uuid, t2.job, t2.sal );

