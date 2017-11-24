select rtrim( cust_contact ) as cContact
from customers
where cust_id in (
        select cust_id
        from orders
        where order_num in (
            select order_num
            from orderitems
            where prod_id = 'RGAN01')
        )
/
