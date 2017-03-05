procedure pay_out_balance(
    account_id_in in accounts.id%type)
is
    l_balance_remaining number;
begin
    loop
        l_balance_remaining := account_balance(account_id_in);

        if l_balance_remaining < 1000
        then
            exit;
        else
            apply_balance(account_id_in, l_balance_remaining);
        end if;
    end loop;
end pay_out_balance;
