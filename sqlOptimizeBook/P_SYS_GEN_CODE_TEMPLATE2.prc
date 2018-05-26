create or replace procedure P_SYS_GEN_CODE_TEMPLATE2
(i_vc_owner in varchar2,
 i_vc_tablename in varchar2,
 o_vc_return_flag out varchar2) is
/*
功能： 用于自动产生批量绑定使用模板二（即数据量未知情况下的批量处理）的代码架构
       适用于表的列名的长度全部为6的表，如果列名的长度不是固定为6，则打印Cursor对应SELECT语句时很可能会出现错位，需要手工调整
作者： cuihua
创建日期：2009-04-13

输入参数：
i_vc_owner:待产生代码结构的表名所在的schema名
i_vc_tablename：待产生代码结构的表名

输出参数：
o_vc_returnflag：用于判断该存储过程是否成功执行，并在出错后存储相应的错误原因。
如果它的值的第一位为S，则表明该存储过程成功执行，没有错误。
如果它的值的第一位为E，则表明该存储过程执行失败，具体错误原因为它的值的第二位到最后一位。

输入输出参数：
无

调用到的存储过程：
无

使用类型：
无
*/

type typ_columnname is table of dba_tab_columns.COLUMN_NAME%type index by binary_integer;
columnnames typ_columnname;

vc_temp varchar2(4000);
n_temp number(13);
n_itemp number(13);

begin

  o_vc_return_flag := 'S';
  
  select column_name bulk collect into columnnames from dba_tab_columns where owner=i_vc_owner and table_name=i_vc_tablename;
  
  ----------------------生成Bulk collect into所需的数组---------Begin--------------------------------------------------------------------------------------
  dbms_output.put_line('  --定义批量fetch的数量，建议值是1000;');
  dbms_output.put_line('  CN_BATCH_SIZE constant pls_integer := 1000;');
  
  dbms_output.put_line(chr(13));
   
  dbms_output.put_line('  --定义存放fetch出来的结果集的数组，建议值是1000'); 
  for i in columnnames.first .. columnnames.last loop       
    dbms_output.put_line('  type typ_' || lower(columnnames(i)) || ' is table of ' || lower(i_vc_tablename) || '.' || lower(columnnames(i)) || '%type index by binary_integer;');
    dbms_output.put_line('  ' || lower(columnnames(i)) || 's typ_' || lower(columnnames(i)) || ';');          
  end loop;
  
  dbms_output.put_line('  type typ_rid is table of urowid index by binary_integer;');
  dbms_output.put_line('  rids typ_rid;'); 
  ----------------------生成Bulk collect into所需的数组---------End--------------------------------------------------------------------------------------

  
  ----------------------生成cursor定义-------------------------Begin--------------------------------------------------------------------------------------
  dbms_output.put_line(chr(13));
  dbms_output.put_line('  cur_' || lower(i_vc_tablename) || ' sys_refcursor;');
   
  vc_temp := null;
  for i in columnnames.first .. columnnames.last loop 
    if( i = columnnames.count ) then
      vc_temp := vc_temp || lower(columnnames(i));
    else
      vc_temp := vc_temp || lower(columnnames(i)) || ',';      
    end if;                     
  end loop;
  
  n_temp := trunc(length(vc_temp)/49) + 1;
  n_itemp := 0;
  for i in 0 .. n_temp loop
    n_itemp := i*49 + 1;
    if( n_itemp <= length(vc_temp) ) then
      if( n_itemp = 1 ) then        
        --如果这里n_temp=1,则表明这个表的字段数小于7
        if ( n_temp = 1 ) then
          dbms_output.put_line('  vc_sql varchar2(4000) :=  ''select ' || substr(vc_temp,n_itemp,49) || ',rowid from ' || lower(i_vc_tablename) || ' where 自定义的带绑定变量的where条件'';');
        else
          dbms_output.put_line('  vc_sql varchar2(4000) :=  ''select ' || substr(vc_temp,n_itemp,49));
        end if;
      else
        if( n_itemp + 49 >= length(vc_temp) ) then
          dbms_output.put_line('       ' || substr(vc_temp,n_itemp,49) || ',rowid from ' || lower(i_vc_tablename) || ' where 自定义的带绑定变量的where条件'';');
        else
          dbms_output.put_line('       ' || substr(vc_temp,n_itemp,49));
        end if;        
      end if;      
    end if;                
  end loop;  
  ----------------------生成cursor定义--------------------------End--------------------------------------------------------------------------------------

  
  ----------------------生成cursor的循环部分的代码--------------begin--------------------------------------------------------------------------------------
  dbms_output.put_line(chr(13));  
  dbms_output.put_line('begin');  
  dbms_output.put_line(chr(13));
  
  dbms_output.put_line('  --带绑定变量的ref cursor的打开方式');
  dbms_output.put_line('  open cur_' || lower(i_vc_tablename) || ' for vc_sql using variable;');
  dbms_output.put_line(chr(13));  
  
  dbms_output.put_line('  --第二种处理方式，批量处理');
  dbms_output.put_line('  loop');
   
  vc_temp := null;
  for i in columnnames.first .. columnnames.last loop 
    if( i = columnnames.count ) then
      vc_temp := vc_temp || lower(columnnames(i)) || 's';
    else
      vc_temp := vc_temp || lower(columnnames(i)) || 's' || ',';
    end if;                     
  end loop;
  
  n_temp := trunc(length(vc_temp)/40) + 1;
  n_itemp := 0;
  for i in 0 .. n_temp loop
    n_itemp := i*40 + 1;
    if( n_itemp <= length(vc_temp) ) then
      if( n_itemp = 1 ) then
        --如果这里n_temp=1,则表明这个表的字段数小于7
        if ( n_temp = 1 ) then
          dbms_output.put_line('    fetch cur_' || lower(i_vc_tablename) || ' bulk collect into ' || substr(vc_temp,n_itemp,40) || ',rids limit CN_BATCH_SIZE;');
        else
          dbms_output.put_line('    fetch cur_' || lower(i_vc_tablename) || ' bulk collect into ' || substr(vc_temp,n_itemp,40));
        end if;
      else
        if( n_itemp + 40 >= length(vc_temp) ) then
          dbms_output.put_line('        ' || substr(vc_temp,n_itemp,40) || ',rids limit CN_BATCH_SIZE;');
        else
          dbms_output.put_line('        ' || substr(vc_temp,n_itemp,40));
        end if;
      end if;       
    end if;                
  end loop;
  
  dbms_output.put_line(chr(10));
  dbms_output.put_line('    for i in 1 .. rids.count loop');
  dbms_output.put_line('      --这里对bulk fetch出来的数组做处理');
  dbms_output.put_line('    end loop;');
  dbms_output.put_line(chr(10));
  dbms_output.put_line('    forall i in 1 .. rids.count');
  dbms_output.put_line('      execute immediate ''自定义的SQL文本'' using rids(i)或其它列;');
  dbms_output.put_line(chr(10));
  dbms_output.put_line('    exit when rids.count < CN_BATCH_SIZE;');
  dbms_output.put_line('  end loop;');
  dbms_output.put_line('  close cur_' || lower(i_vc_tablename) || ';');
  ----------------------生成cursor的循环部分的代码---------------End-------------------------------------------------------------------------------------- 
  
exception
  when others then
    o_vc_return_flag := 'E' || '_' || sqlcode || '_' || sqlerrm;    
    return;
  
end P_SYS_GEN_CODE_TEMPLATE2;
/
