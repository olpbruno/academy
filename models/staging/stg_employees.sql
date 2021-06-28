{{ config(materialized='ephemeral') }}

with source_data as (

    select 
        employee_id,
        concat(first_name,' ', last_name) as employee_name,
        title,
        country,
        region,
        city,
        postal_code,
        hire_date,
        extension,
        address,
        birth_date,
        photo_path,
        title_of_courtesy,
        notes,
        home_phone,
        reports_to

/*      _sdc_table_version,
        _sdc_received_at,
        _sdc_sequence,
        _sdc_batched_at,
        _sdc_extracted_at */
    from {{ source('northwind','employees') }}
)

select *
from source_data