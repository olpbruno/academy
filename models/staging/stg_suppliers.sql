{{ config(materialized='ephemeral') }}

with source_data as (

    select 
        supplier_id,
        company_name,
        contact_name,
        contact_title,
        country,
        city,
        fax,
        postal_code,
        homepage,
        address,
        region,
        phone

--        _sdc_table_version,
--        _sdc_received_at,
--        _sdc_sequence,
--        _sdc_batched_at,
--       _sdc_extracted_at
    from {{ source('northwind','suppliers') }}
)

select *
from source_data

