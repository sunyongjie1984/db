declare -- ��������
    a int:= 100;
    b int:= 200;
    c number;

begin -- ִ�в���
    c := (a + b) / (a - b);
    dbms_output.put_line(c);

exception --�쳣���� ��ѡ
    when
        zero_divide
    then
        dbms_output.put_line('divide zero');
end;
/
