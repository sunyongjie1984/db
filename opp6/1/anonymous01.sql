declare
    l_book_count integer;

begin
    select count(*)
    into l_book_count
    from books
    where author like '%steven%';

    dbms_output.put_line(
        'steven has written ' ||
        l_book_count ||
        ' books.');

    update books
    set author = replace(author, 'steven', 'stephen')
    where author like '%steven%';

end;
/
