select
-- total numbers of each customers in the customers table
    o.cust_id,
    o.order_num,
    rtrim(c.cust_name) as cName,
    rtrim( c.cust_contact ) as cContact
    from orders o
    -- inner join customers c
    right join customers c
    on o.cust_id = c.cust_id
    order by o.cust_id
/
