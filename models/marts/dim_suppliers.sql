with
    dim_suppliers as (
        select 
            {{ dbt_utils.generate_surrogate_key(['id', 'companyname', 'contactname']) }} as sk_product
            , *
        from {{ref("stg_suppliers")}}
    )

select * 
from dim_suppliers