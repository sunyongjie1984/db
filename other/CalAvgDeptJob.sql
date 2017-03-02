declare
i Integer;
Begin
    dbms_job.submit(i,'calavgdeptsal;',Sysdate,'sysdate + 10 / 1440');
end;
