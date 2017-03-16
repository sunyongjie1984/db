#!/bin/bash
sqlplus hsfa/hsfa_0601@fa30test
set feedback off 　--回显本次sql命令处理的记录条数，缺省为on
set pagesize 0 　　--输出每页行数，缺省为24,设定为0表示不分页
set long 90000
set echo off --不显示执行的sql语句
set feedback off --不显示XX rows selected的行
set heading off --不显示表头
set termout off --不显示脚本运行结果
set trimspool on --去掉脚本输出行尾部的空格
set pagesize 0 --设置pagesize为零，不让oracle进行分页处理
set linesize 10000 --设置每行最大列数
set colsep '    ' --设置列之间的分隔符
sqlplus hsfa/hsfa_0601@fa30test spool ./schema.sql　　   --输出文件路径，可以是全路径或是相对路径
sqlplus hsfa/hsfa_0601@fa30test @test3;
sqlplus hsfa/hsfa_0601@fa30test spool off;
sqlplus disconnect;
sqlplus quit;
