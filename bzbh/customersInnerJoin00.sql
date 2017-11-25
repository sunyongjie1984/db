select
-- total numbers of each customers in the customers table
o.cust_id,
    rtrim(c.cust_name) as cName,
    rtrim( c.cust_contact ) as cContact,
    count( * )
    from orders o
    inner join customers c
    on o.cust_id = c.cust_id
    group by o.cust_id, c.cust_name, c.cust_contact
    order by o.cust_id
/
