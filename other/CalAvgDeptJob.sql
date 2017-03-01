declare
i Integer;
Begin
    dbms_job.submit(i,'calavgdeptsal;',Sysdate,'sysdate+1/1440');
end;
