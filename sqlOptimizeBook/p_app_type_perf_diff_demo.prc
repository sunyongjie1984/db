create or replace procedure p_app_type_perf_diff_demo(vc_apptype in varchar2) is

/*
���ܣ� ����Oracle���ݿ�������Ӧ�����ͣ�Ӳ����������������������һ�ν��������ִ�У���ʵ�����ܶԱ�
���ߣ� cuihua
�������ڣ�2013-03-09

���������
vc_apptype:Ӧ�����ͣ���ֵ������TYPE1��TYPE2��TYPE3��TYPE4��TYPE4_ADVANCED��
           TYPE1��ʾӦ������һ��Ӳ������
           TYPE2��ʾӦ�����Ͷ����������
           TYPE3��ʾӦ�������������������
           TYPE4��ʾӦ�������ģ�һ�ν��������ִ�У�
           TYPE4_ADVANCED��ʾ�Ľ����Ӧ�������ģ�һ�ν��������ִ�� + �����󶨣�
���������
��

�������������
��

���õ��Ĵ洢���̣�
��

ʹ�����ͣ�
����
*/
  
  lc_pin_allocation_gets_start number;
  lc_pin_allocation_gets_end number;
  lc_lock_allocation_gets_start number;
  lc_lock_allocation_gets_end number;
  lc_lock_gets_start number;
  lc_lock_gets_end number;
  lc_gets_start number;
  lc_gets_end number;
  lc_pin_gets_start number;
  lc_pin_gets_end number;
  lc_load_lock_gets_start number;
  lc_load_lock_gets_end number;
  
  lc_pin_allocation_igets_start number;
  lc_pin_allocation_igets_end number;
  lc_lock_allocation_igets_start number;
  lc_lock_allocation_igets_end number;
  lc_lock_igets_start number;
  lc_lock_igets_end number;
  lc_igets_start number;
  lc_igets_end number;
  lc_pin_igets_start number;
  lc_pin_igets_end number;
  lc_load_lock_igets_start number;
  lc_load_lock_igets_end number;
  
  duration interval day to second;
  t_start timestamp;
  t_end timestamp;  
  vc_sql varchar2(32767);
  n_temp number;
  error_message varchar2(4000);
  
  cursor c1 is select level id from dual connect by level <= 10000;
  type typ_result is record(id number);
  rec_c1 typ_result;
  
  type typ_results is varray(1000) of typ_result;
  results typ_results;
  cur_c1_advanced sys_refcursor;
  CN_BATCH_SIZE constant pls_integer := 1000;
  
begin
  
  execute immediate 'alter system flush shared_pool';
  execute immediate 'alter system flush buffer_cache';
  
  select gets,immediate_gets into lc_pin_allocation_gets_start,lc_pin_allocation_igets_start from v$latch where name = 'library cache pin allocation';
  select gets,immediate_gets into lc_lock_allocation_gets_start,lc_lock_allocation_igets_start from v$latch where name = 'library cache lock allocation';
  select gets,immediate_gets into lc_lock_gets_start,lc_lock_igets_start from v$latch where name = 'library cache lock';
  select gets,immediate_gets into lc_gets_start,lc_igets_start from v$latch where name = 'library cache';
  select gets,immediate_gets into lc_pin_gets_start,lc_pin_igets_start from v$latch where name = 'library cache pin';
  select gets,immediate_gets into lc_load_lock_gets_start,lc_load_lock_igets_start from v$latch where name = 'library cache load lock';
  
  t_start := systimestamp;  
  vc_sql := 'select count(*) from t1 where object_id = :1'; 
  
  if ( upper(vc_apptype) = 'TYPE1' ) then
    for i in 1..10000 loop
      execute immediate 'select count(*) from t1 where object_id = ' || to_char(i) into n_temp;
    end loop;
  elsif ( upper(vc_apptype) = 'TYPE2' ) then
    execute immediate 'alter session set session_cached_cursors = 0';
    p_gen_multl_sql_with_bind_v(vc_sql,n_temp);
  elsif ( upper(vc_apptype) = 'TYPE3' ) then
    execute immediate 'alter session set session_cached_cursors = 200';
     p_gen_multl_sql_with_bind_v(vc_sql,n_temp);      
  elsif ( upper(vc_apptype) = 'TYPE4' ) then
    execute immediate 'alter session set session_cached_cursors = 200';
    open c1;
    fetch c1 into rec_c1;
    while (c1%found) loop
      execute immediate vc_sql into n_temp using rec_c1.id;    
      fetch c1 into rec_c1;
    end loop;
    close c1;
  elsif ( upper(vc_apptype) = 'TYPE4_ADVANCED' ) then
    open cur_c1_advanced for select level id from dual connect by level <= 10000;
    loop
      fetch cur_c1_advanced bulk collect into results limit CN_BATCH_SIZE;

      for i in 1 .. results.count loop
        execute immediate vc_sql using results(i).id;
      end loop;

      exit when results.count < CN_BATCH_SIZE;
    end loop;
    close cur_c1_advanced; 
  end if;
   
  t_end := systimestamp;
  duration := t_end - t_start;
  dbms_output.put_line ('Total elapsed time is : '|| to_char(duration));
  
  select gets,immediate_gets into lc_pin_allocation_gets_end,lc_pin_allocation_igets_end from v$latch where name = 'library cache pin allocation';
  select gets,immediate_gets into lc_lock_allocation_gets_end,lc_lock_allocation_igets_end from v$latch where name = 'library cache lock allocation';
  select gets,immediate_gets into lc_lock_gets_end,lc_lock_igets_end from v$latch where name = 'library cache lock';
  select gets,immediate_gets into lc_gets_end,lc_igets_end from v$latch where name = 'library cache';
  select gets,immediate_gets into lc_pin_gets_end,lc_pin_igets_end from v$latch where name = 'library cache pin';
  select gets,immediate_gets into lc_load_lock_gets_end,lc_load_lock_igets_end from v$latch where name = 'library cache load lock';
 
  dbms_output.put_line ('Library cache pin allocation gets is : '|| to_char(lc_pin_allocation_gets_end-lc_pin_allocation_gets_start));
  dbms_output.put_line ('Library cache pin allocation immediate gets is : '|| to_char(lc_pin_allocation_igets_end-lc_pin_allocation_igets_start));  
  dbms_output.put_line ('Library cache lock allocation gets is : '|| to_char(lc_lock_allocation_gets_end-lc_lock_allocation_gets_start));
  dbms_output.put_line ('Library cache lock allocation immediate gets is : '|| to_char(lc_lock_allocation_igets_end-lc_lock_allocation_igets_start));
  dbms_output.put_line ('Library cache lock gets is : '|| to_char(lc_lock_gets_end-lc_lock_gets_start));
  dbms_output.put_line ('Library cache lock immediate gets is : '|| to_char(lc_lock_igets_end-lc_lock_igets_start));  
  dbms_output.put_line ('Library cache gets is : '|| to_char(lc_gets_end-lc_gets_start));
  dbms_output.put_line ('Library cache immediate gets is : '|| to_char(lc_igets_end-lc_igets_start));  
  dbms_output.put_line ('Library cache pin gets is : '|| to_char(lc_pin_gets_end-lc_pin_gets_start));
  dbms_output.put_line ('Library cache pin immediate gets is : '|| to_char(lc_pin_igets_end-lc_pin_igets_start));  
  dbms_output.put_line ('Library cache load lock gets is : '|| to_char(lc_load_lock_gets_end-lc_load_lock_gets_start));
  dbms_output.put_line ('Library cache load lock immediate gets is : '|| to_char(lc_load_lock_igets_end-lc_load_lock_igets_start));    

exception
  when others then
    error_message :='E'|| sqlcode || sqlerrm;
    dbms_output.put_line(error_message);
    return;  
end p_app_type_perf_diff_demo;
/
