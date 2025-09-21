with
    orders_details as (
        select 
            id
            , discount
            , orderid
            , productid
            , quantity
            , unitprice
        from {{source('northwind', 'order_details')}}
    )

select *
from order_details