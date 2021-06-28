{{ config(materialized='ephemeral') }}

with source_data as (

    select 
        region_description,
        region_id	
/*      _sdc_table_version,
        _sdc_received_at,
        _sdc_sequence,
        _sdc_batched_at,
        _sdc_extracted_at */
    from {{ source('northwind','region') }}
)

select *
from source_data