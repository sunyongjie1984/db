create or replace procedure check_account(
    account_id_in in accounts.id%type)
is
    l_balance_remaining number;
    l_balance_below_minimum exception;
    l_account_name accounts.name%type;

begin
    select name
    into l_account_name
    from accounts
    where id = account_id_in;

    l_balance_remaining := account_balance(account_id_in);

    dbms_output.put_line('Balance for ' || l_account_name || ' = ' || l_balance_remaining);

    if l_balance_remaining < 1000
    then raise l_balance_below_minimum;
    end if;

exception
    when no_data_found
    then
        -- no account found for this id
    log_error();

    when l_balance_below_minimum
    then log_error();
    raise;
end check_account;
/
