col name format a30
col value format a20
select name, value from v$parameter where name = 'db_block_size';

