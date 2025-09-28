with
    customers as (
        select *
        from {{ ref("dim_customers")}}
    )

    , orders as (
        select *
        from {{ ref("stg_orders")}}
    )

    , suppliers as (
        select *
        from {{ ref("dim_suppliers")}}
    )

    , products as (
        select *
        from {{ ref("dim_products")}}
    )

    , categories as (
        select *
        from {{ ref("dim_categories") }}
    )

    , order_details as (
        select * 
        from {{ ref("stg_orders_details") }}
    )
    

    select
        customers.sk_customer
        , orders.*
        , order_details.discount
        , order_details.quantity
        , products.discontinued
        , products.product_name
        , products.QUANTITY_PER_UNIT
        , products.REORDER_LEVEL
        , products.UNITS_IN_STOCK
        , products.UNITS_ON_ORDER
        , products.UNIT_PRICE
        , categories.*
        , suppliers.*
    from orders
    left join customers on orders.customer_id = customers.customer_id
    left join order_details on orders.order_id = order_details.order_id
    left join products on order_details.product_id = products.product_id
    left join categories on products.category_id = categories.category_id
    left join suppliers on products.supplier_id = suppliers.supplier_id
