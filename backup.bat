#exp hr/hr@thinkpad file=d:\git\db\hr.dmp
#exp scott/tiger_1234@thinkpad file=d:\git\db\scott.dmp
set LANG=en-US



for /f %%I in ('wmic os get localdatetime ^|find "20"') do set dt=%%I
REM dt format is now YYYYMMDDhhmmss...
set dt=%dt:~4,2%-%dt:~2,2%-%dt:~0,4%
echo %dt%

set filename=local_orcl_scott_%dt%.dmp
echo %filename%
exp scott/tiger@orcl file=%filename%



