declare
    season int := 3;
    aboutInfo varchar2(50);
begin
    case season
    when 1 then
        aboutInfo := season || ' season including 1,2,3';
    when 2 then
        aboutInfo := season || ' season including 4,5,6';
    when 3 then
        aboutInfo := season || ' season including 7,8,9';
    when 4 then
        aboutInfo := season || ' season including 10,11,12';
    else
        aboutInfo := season || 'illeagle';
    end case;
    dbms_output.put_line(aboutInfo);
end;
/
