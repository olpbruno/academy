{{ config(materialized='ephemeral') }}

with source_data as (

    select 
        employee_id,
        territory_id	
/*      _sdc_table_version,
        _sdc_received_at,
        _sdc_sequence,
        _sdc_batched_at,
        _sdc_extracted_at */
    from {{ source('northwind','employee_territories') }}
)

select *
from source_data