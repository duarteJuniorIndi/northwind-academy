with 
    source as (
        select * from {{ source('erp', 'suppliers') }}
    )
    , renamed as (
        select
            cast (id as int) as supplier_pk
            , cast (companyname as varchar) as supplier_name
            -- , cast (contactname as varchar) as suppliers_contactname
            -- , cast (contacttitle as varchar) as suppliers_contacttitle
            -- , cast (address as varchar) as suppliers_adress
            , cast (city as varchar) as supplier_city
            , cast (region as varchar) as supplier_region
            -- , cast (postalcode as varchar) as suppliers_
            , cast (country as varchar) as supplier_country
            -- , cast (phone as varchar) as suppliers_
            -- , cast (fax as varchar) as suppliers_
            -- , cast (homepag as varchar) as suppliers_
        from source
    )
select *
from renamed
