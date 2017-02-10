create view WorkOvertimeReport as
SELECT w.Name,
w.DeptName,
w.Empno,
w.day,
w.InTime,
w.OutTime,
w.week,
w.hours,
CASE
WHEN w.week IN ('ÐÇÆÚÁù', 'ÐÇÆÚÈÕ')
    THEN
    FLOOR (w.hours / 4) * 30
ELSE
    30
END
AS amount
FROM (SELECT t.Name,
    t.DeptName,
    t.Empno,
    t.day,
    t.InTime,
    t.OutTime,
    t.week,
    ROUND (
        TO_NUMBER (
            TO_DATE (OutTime, 'yyyy-mm-dd hh24:mi:ss')
            - TO_DATE (InTime, 'yyyy-mm-dd hh24:mi:ss'))
        * 24)
    AS hours
    FROM (  SELECT d.field9021002 AS Name,
        -- add DeptName
        p.department_name AS DeptName,
        d.eai_template AS Empno,
        -- no max for day
        SUBSTR (d.field9021003, 1, 10) AS day,
        -- max function
        -- min function
        MIN (d.field9021003) AS InTime,
        MAX (d.field9021003) AS OutTime,
        -- add week
        MAX (
            TO_CHAR (
                TO_DATE (field9021003, 'yyyy-mm-dd hh24:mi:ss'),
                'day'))
        AS week
        FROM XDJZ_EAI_INVOICE_DATA_9021 d, xdjz_eai_hr_person p
        WHERE     (d.field9021003 BETWEEN '2016-05-01 00:00:00'
            AND '2016-05-24 23:59:59')
        AND -- and Empno should not be null
        (d.eai_template != 'NULL')
        AND -- two table empno should be the same
        (d.eai_template = p.job_number)
        -- group by
        GROUP BY -- add DeptName
        d.field9021002,
        d.eai_template,
        p.department_name,
        SUBSTR (d.field9021003, 1, 10)
        -- order by name and time
        ORDER BY -- first by people, second by outtime
        DeptName, Empno, OutTime) t
    WHERE -- after 18:30, counts
     (SUBSTR (OutTime, -8) > '18:30:00')) w;
