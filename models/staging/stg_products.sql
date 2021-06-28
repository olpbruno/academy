{{ config(materialized='ephemeral') }}

with source_data as (

    select 
        product_id,
        units_in_stock,
        category_id,
        unit_price,
        reorder_level,
        product_name,
        quantity_per_unit,
        supplier_id,
        units_on_order,
        case 
            when discontinued = 0 then 'Não'
            else 'Sim'
        end as is_discontinued

--        _sdc_table_version,
--        _sdc_received_at,
--        _sdc_sequence,
--        _sdc_batched_at,
--       _sdc_extracted_at
    from {{ source('northwind','products') }}
)

select *
from source_data

