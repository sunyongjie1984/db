create or replace function wordcount(str in varchar2)
    return pls_integer
as
    words pls_integer := 0;
    len   pls_integer := nvl(length(str), 0);
    inside_a_word boolean;
begin
    for i in 1..len + 1
    loop
        if ascii(substr(str, i, 1)) < 33 or i > len
        then
            if inside_a_word
            then
                words := words + 1;
                inside_a_word := false;
            end if;
        else
            inside_a_word := true;
        end if;
    end loop;
    return words;
end;
/
