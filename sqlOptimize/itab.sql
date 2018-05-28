create or replace procedure itab

as 

begin

  for i in 100 .. 900 loop

      insert into dd values (i, 'TEST', 'BEIJING');

    end loop;

    commit;

end;
