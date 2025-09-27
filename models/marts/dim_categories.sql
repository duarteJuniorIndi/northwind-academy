with
    dim_categories as (
        select 
            {{ dbt_utils.generate_surrogate_key(['id', 'categoryname']) }} as sk_product
            , *
        from {{ref("stg_categories")}}
    )

select * 
from dim_categories