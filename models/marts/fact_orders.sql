{{ config(materialized='table') }}

with orders as (
    select * 
    from {{ ref('stg_orders')}}
),
    order_details as (
    select * 
    from {{ ref('stg_order_details')}}
),
    customers as (
    select * 
    from {{ ref('dim_customers')}}
),  products as (
    select * 
    from {{ ref('dim_products')}}
),  employees as (
    select * 
    from {{ ref('dim_employees')}}
),  suppliers as (
    select * 
    from {{ ref('dim_suppliers')}}
),  shippers as (
    select * 
    from {{ ref('dim_shippers')}}
),
 orders_with_sk as (
    select
        orders.order_id,
        customers.customer_sk,
        employees.employee_sk,
        shippers.shipper_sk,
        orders.order_date,
        orders.required_date,
        orders.freight
    from orders
    left join customers on orders.customer_id = customers.customer_id
    left join employees on orders.employee_id = employees.employee_id
    left join shippers on orders.shipper_id = shippers.shipper_id
 ),
 
    order_details_with_sk as(
        select
        order_details.order_id,
        products.product_sk,
        suppliers.supplier_sk,
        order_details.discount,
        order_details.unit_price,
        order_details.quantity
    from order_details
    left join products on order_details.product_id = products.product_id
    left join suppliers on products.supplier_id = suppliers.supplier_sk
    ),

    final as (
    select
        order_detail.order_id,
        orders.customer_sk,
        orders.employee_sk,
        orders.shipper_sk,
        orders.order_date,
        orders.required_date,
        order_detail.product_sk,
        order_detail.supplier_sk,
        order_detail.discount,
        order_detail.unit_price,
        order_detail.quantity,
        order_detail.unit_price * order_detail.quantity as subtotal
        from order_details_with_sk as order_detail
        left join orders_with_sk as orders on order_detail.order_id = orders.order_id

)

select * from final