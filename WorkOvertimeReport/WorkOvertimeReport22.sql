select * from
(
    select
        d.field9021002 as Name,
        d.eai_template as Empno,
        -- no max for day
        substr(d.field9021003, 1, 10) as day,
        -- max function
        -- min function
        min(d.field9021003) as InTime,
        max(d.field9021003) as OutTime,
        -- add week
        max(to_char(to_date(field9021003, 'yyyy-mm-dd hh24:mi:ss'), 'day')) as week
    from
        XDJZ_EAI_INVOICE_DATA_9021 d
    where
            (d.field9021003 between '2016-05-04 00:00:00' and '2016-05-05 23:59:59')
        and
            -- and Empno should not be null
            d.eai_template != 'NULL'
    -- group by
    group by
        d.field9021002, d.eai_template, substr(d.field9021003, 1, 10)
    -- order by name and time
    order by
        Empno, OutTime
)
where
    (substr(OutTime, -8) > '18:30:00');
