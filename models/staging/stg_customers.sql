with
    customers as (
        select 
            id
            , contactname
            , companyname
            , contacttitle
            , fax
            , phone
            , address
            , postalcode
            , city
            , region
            , country
        from {{source('northwind', 'customers')}}
    )

select *
from customers