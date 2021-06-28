{{ config(materialized='ephemeral') }}

with source_data as (

    select 
        country,
        city,
        fax,
        postal_code,
        address,
        region,
        customer_id,
        contact_name,
        phone,
        company_name,
        contact_title

/*      _sdc_table_version,
        _sdc_received_at,
        _sdc_sequence,
        _sdc_batched_at,
        _sdc_extracted_at */
    from {{ source('northwind','customers') }}
)

select *
from source_data