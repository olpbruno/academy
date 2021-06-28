with staging as (
    select * 
    from {{ ref('stg_region')}}
),
 final as (
     select
     row_number() over (order by region_id) as region_sk, -- chave surrogate auto incremental
     *
     from staging
 )

select * from final