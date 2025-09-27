with
    categories as (
        select *
        from {{source('northwind', 'category')}}
    )

select *
from categories