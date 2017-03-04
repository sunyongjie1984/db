declare -- 声明部分
    a int:= 100;
    b int:= 200;
    c number;

begin -- 执行部分
    c := (a + b) / (a - b);
    dbms_output.put_line(c);

exception --异常部分 可选
    when
        zero_divide
    then
        dbms_output.put_line('divide zero');
end;
/
