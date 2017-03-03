insert into job_emp
select * from jobs
where jobs.max_salary > 10000;
