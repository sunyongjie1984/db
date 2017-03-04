create or replace function FunIntro (a int, b int) return number is
    c number;
begin
    c := (a + b) / (a - b);
    dbms_output.put_line(c);
    return (c);

exception
    when
        zero_divide
    then
        dbms_output.put_line('divide zero');
        return (0);
end;
/
