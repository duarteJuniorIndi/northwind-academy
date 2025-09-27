with
    dim_products as (
        select 
            {{ dbt_utils.generate_surrogate_key(['id', 'productname']) }} as sk_product
            , *
        from {{ref("stg_products")}}
    )

select * 
from dim_products