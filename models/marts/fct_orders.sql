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
        , order_details.*
        , products.*
        , categories.*
        , suppliers.*
    from orders
    left join customers on orders.customerid = customers.id
    left join order_details on orders.id = order_details.orderid
    left join products on order_details.productid = products.id
    left join categories on products.categoryid = categories.id
    left join suppliers on products.supplierid = suppliers.id
