declare
l_book_count integer;

begin
    select count(*)
    into l_book_count
    from books
    where author like '%FEUERSTEIN, STEVEN%';

    dbms_output.put_line (
        'Steven has written (or co-written) ' || l_book_count || ' books.');

    -- oh I have changed my name, so ..
    update books
    set author = REPLACE (author, 'STEVEN', 'STEPHEN')
    where author like '%FEUERSTEIN, STEVEN%';
end;
/
