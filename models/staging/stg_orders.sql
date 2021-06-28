{{ config(materialized='ephemeral') }}

with source_data as (

    select 
        order_id,
        employee_id,
        customer_id,
        order_date,
        ship_region,
        shipped_date,
        ship_country,
        ship_name,
        ship_postal_code,
        ship_city,
        freight,
        ship_via as shipper_id,
        ship_address,
        required_date

/*      _sdc_table_version,
        _sdc_received_at,
        _sdc_sequence,
        _sdc_batched_at,
        _sdc_extracted_at */
    from {{ source('northwind','orders') }}
)

select *
from source_data