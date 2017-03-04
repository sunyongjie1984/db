create or replace procedure trun_table(table_deleted in varchar2) as
    cur_name integer;
begin
    cur_name :=dbms_sql.open_cursor;
    dbms_sql.parse(cur_name,'truncate table'||table_deleted||
        'drop storage',dbms_sql.native);
    dbms_sql.close_cursor(cur_name);
exception
when others then
    dbms_sql.close_cursor(cur_name);
    raise;
end trun_table;
/
