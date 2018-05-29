-- set pagesize 30;
--spool "d:\git\db\spool.log" app;
spool "spool.log" app;
set linesize 100;
set pause on;
set trim on;

set serveroutput on;
set sqlprompt "_USER'@'_CONNECT_IDENTIFIER > "
-- set echo on;

define _EDITOR = vi;
--DEFINE _EDITOR         = "C:\Program Files (x86)\Vim\vim81\gvim.exe"(CHAR) ;
set SQLPROMPT "_USER'@'_CONNECT_IDENTIFIER >";

col name format a10;
col padding format a20;
col Name format a10;
col cname format a20;
col ccontact format a20;
col sname format a20;
col prod_name format a25;
col Name format a30;
col cust_name format a30;
col cust_address format a30;
col cust_contact format a30;
col depcode format a20;
col depname format a20;
-- col id format a30;
col Table_Name format a28;
col Tame format a10;
col day format a12;
col out_time format a20;
col Outtime format a20;
col InTime format a20;
col Time format a20;
col in_time format a25;
col name format a10;
col hours format 99;
col empno format 9999;
col week format a06;
col dept_name format a25;
col deptname format a25;
col object_name format a25;
col avgsal format $999,999.00;
col sal format $999,999.00;
col parentcode format a20;
col oweraccount format a20;
col owerpreperty format a20;
col oastatus format a20;
col jdstatus format a20;
col membercode format a20;
col membername format a20;
col accountcode format a20;
col email format a20;
col telephone format a20;
col mobilephone format a20;
col vc_name format a30;
col mobilephone format a20;
col mobilephone format a20;
col PROD_DESC format a30;
col productsName format a30;
set autotrace on;
